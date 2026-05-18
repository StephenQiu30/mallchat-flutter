import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:mallchat_flutter/api/request.dart';

/// WebSocket 事件类型
enum WsEventType {
  /// 登录授权
  login('LOGIN'),

  /// 在线用户列表
  onlineUsers('ONLINE_USERS'),

  /// 心跳
  heartBeat('HEART_BEAT'),

  /// 会话更新
  sessionUpdate('SESSION_UPDATE'),

  /// 新消息
  message('MESSAGE'),

  /// 消息撤回
  recall('RECALL'),

  /// 好友申请
  friendApply('FRIEND_APPLY');

  final String value;
  const WsEventType(this.value);

  static WsEventType? fromValue(String? value) {
    if (value == null) return null;
    for (final type in WsEventType.values) {
      if (type.value == value) return type;
    }
    return null;
  }
}

/// WebSocket 事件数据
class WsEvent {
  const WsEvent({
    required this.type,
    this.data,
  });

  final WsEventType type;
  final dynamic data;

  factory WsEvent.fromJson(Map<String, dynamic> json) {
    final type = WsEventType.fromValue(json['type'] as String?);
    if (type == null) {
      return WsEvent(
        type: WsEventType.heartBeat,
        data: json,
      );
    }
    return WsEvent(type: type, data: json['data']);
  }
}

/// WebSocket 连接状态
enum WsConnectionState {
  disconnected,
  connecting,
  connected,
}

/// WebSocket 事件回调
typedef WsEventListener = void Function(WsEvent event);

/// WebSocket 服务
///
/// 负责与服务端 WebSocket 通信，包括：
/// - 连接管理（自动重连）
/// - 心跳保活
/// - 事件分发
class WebSocketService {
  WebSocketService._();
  static final WebSocketService instance = WebSocketService._();

  WebSocketChannel? _channel;
  Timer? _heartbeatTimer;
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;
  static const int _maxReconnectAttempts = 10;
  static const Duration _heartbeatInterval = Duration(seconds: 30);
  static const Duration _baseReconnectDelay = Duration(seconds: 2);

  final _stateController =
      StreamController<WsConnectionState>.broadcast();
  final _eventController = StreamController<WsEvent>.broadcast();
  final Map<String, List<WsEventListener>> _listeners = {};

  /// 当前连接状态
  WsConnectionState _state = WsConnectionState.disconnected;
  WsConnectionState get state => _state;

  /// 连接状态变更流
  Stream<WsConnectionState> get stateStream => _stateController.stream;

  /// 事件流
  Stream<WsEvent> get eventStream => _eventController.stream;

  /// 建立 WebSocket 连接
  Future<void> connect() async {
    if (_state == WsConnectionState.connecting ||
        _state == WsConnectionState.connected) {
      return;
    }

    _updateState(WsConnectionState.connecting);

    try {
      final prefs = Request.instance.dio.options;
      final baseUrl = prefs.baseUrl
          .replaceFirst('http://', 'ws://')
          .replaceFirst('https://', 'wss://')
          .replaceFirst('/api', '');
      final wsUrl = '$baseUrl/ws';

      _channel = WebSocketChannel.connect(Uri.parse(wsUrl));

      // 等待连接建立
      await _channel!.ready;

      _updateState(WsConnectionState.connected);
      _reconnectAttempts = 0;

      // 发送登录授权消息
      _sendLogin();

      // 启动心跳
      _startHeartbeat();

      // 监听消息
      _channel!.stream.listen(
        _onMessage,
        onDone: _onDisconnected,
        onError: _onError,
      );

      debugPrint('[WebSocket] Connected to $wsUrl');
    } catch (e) {
      debugPrint('[WebSocket] Connection failed: $e');
      _updateState(WsConnectionState.disconnected);
      _scheduleReconnect();
    }
  }

  /// 断开连接
  void disconnect() {
    _heartbeatTimer?.cancel();
    _reconnectTimer?.cancel();
    _channel?.sink.close();
    _channel = null;
    _updateState(WsConnectionState.disconnected);
    _reconnectAttempts = 0;
    debugPrint('[WebSocket] Disconnected');
  }

  /// 注册事件监听器
  void addEventListener(String key, WsEventType type, WsEventListener listener) {
    final typeKey = '${type.value}_$key';
    _listeners.putIfAbsent(typeKey, () => []).add(listener);
  }

  /// 移除事件监听器
  void removeEventListener(String key, WsEventType type) {
    final typeKey = '${type.value}_$key';
    _listeners.remove(typeKey);
  }

  /// 发送 JSON 消息
  void send(Map<String, dynamic> message) {
    if (_state != WsConnectionState.connected) {
      debugPrint('[WebSocket] Cannot send: not connected');
      return;
    }
    _channel?.sink.add(jsonEncode(message));
  }

  // --- Private Methods ---

  void _onMessage(dynamic data) {
    try {
      final json = jsonDecode(data as String) as Map<String, dynamic>;
      final event = WsEvent.fromJson(json);

      debugPrint('[WebSocket] Received: ${event.type.value}');

      // 广播到事件流
      _eventController.add(event);

      // 分发到注册的监听器
      for (final entry in _listeners.entries) {
        if (entry.key.startsWith(event.type.value)) {
          for (final listener in entry.value) {
            listener(event);
          }
        }
      }
    } catch (e) {
      debugPrint('[WebSocket] Parse error: $e');
    }
  }

  void _onDisconnected() {
    debugPrint('[WebSocket] Connection closed');
    _heartbeatTimer?.cancel();
    _updateState(WsConnectionState.disconnected);
    _scheduleReconnect();
  }

  void _onError(dynamic error) {
    debugPrint('[WebSocket] Error: $error');
    _heartbeatTimer?.cancel();
    _updateState(WsConnectionState.disconnected);
    _scheduleReconnect();
  }

  void _sendLogin() {
    final prefs = Request.instance.dio.options;
    final token = prefs.headers['Authorization']?.toString().replaceFirst('Bearer ', '') ?? '';
    send({'type': WsEventType.login.value, 'data': token});
  }

  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(_heartbeatInterval, (_) {
      send({'type': WsEventType.heartBeat.value});
    });
  }

  void _scheduleReconnect() {
    if (_reconnectAttempts >= _maxReconnectAttempts) {
      debugPrint('[WebSocket] Max reconnect attempts reached');
      return;
    }

    _reconnectTimer?.cancel();
    final delay = _baseReconnectDelay * (1 << _reconnectAttempts.clamp(0, 5));
    _reconnectAttempts++;

    debugPrint(
      '[WebSocket] Reconnecting in ${delay.inSeconds}s (attempt $_reconnectAttempts)',
    );

    _reconnectTimer = Timer(delay, () {
      connect();
    });
  }

  void _updateState(WsConnectionState newState) {
    _state = newState;
    _stateController.add(newState);
  }

  /// 释放资源
  void dispose() {
    disconnect();
    _stateController.close();
    _eventController.close();
    _listeners.clear();
  }
}
