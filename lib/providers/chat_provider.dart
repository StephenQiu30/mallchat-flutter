import 'package:flutter/foundation.dart';
import 'package:mallchat_flutter/api/chat/export.dart';
import 'package:mallchat_flutter/api/user/models/login_user_vo.dart';
import 'package:mallchat_flutter/common/enums.dart';
import 'package:mallchat_flutter/models/chat_message_item.dart';
import 'package:mallchat_flutter/services/api/chat_api.dart';
import 'package:mallchat_flutter/services/api/message_api.dart';
import 'package:mallchat_flutter/services/service_exception.dart';
import 'package:mallchat_flutter/services/websocket_service.dart';

/// 聊天状态管理 (Provider)
///
/// 管理会话列表、消息收发、已读状态、WebSocket 消息推送
class ChatProvider extends ChangeNotifier {
  static const int _pageSize = 20;

  final ChatApi _chatApi = const ChatApi();
  final MessageApi _messageApi = const MessageApi();
  final WebSocketService _ws = WebSocketService.instance;

  List<ChatSessionVo> _sessions = [];
  int? _activeRoomId;
  final Map<int, List<ChatMessageItem>> _messagesByRoom = {};
  bool _sessionLoading = false;
  final Map<int, bool> _historyLoadingByRoom = {};
  final Map<int, bool> _hasMoreHistoryByRoom = {};
  final Map<String, LocalMessageSendState> _sendStateByTempId = {};

  LoginUserVo? _currentUser;

  // --- Getters ---

  List<ChatSessionVo> get sessions => List.unmodifiable(_sessions);
  int? get activeRoomId => _activeRoomId;
  bool get sessionLoading => _sessionLoading;

  ChatSessionVo? get activeSession {
    final roomId = _activeRoomId;
    if (roomId == null) return null;
    try {
      return _sessions.firstWhere((item) => item.roomId == roomId);
    } catch (_) {
      return null;
    }
  }

  List<ChatMessageItem> get activeMessages {
    final roomId = _activeRoomId;
    if (roomId == null) return const [];
    return List.unmodifiable(_messagesByRoom[roomId] ?? const []);
  }

  int get totalUnreadCount =>
      _sessions.fold<int>(0, (sum, item) => sum + (item.unreadCount ?? 0));

  String? get unreadBadgeLabel {
    if (totalUnreadCount <= 0) return null;
    if (totalUnreadCount > 99) return '99+';
    return totalUnreadCount.toString();
  }

  bool isHistoryLoading(int roomId) => _historyLoadingByRoom[roomId] ?? false;
  bool hasMoreHistory(int roomId) => _hasMoreHistoryByRoom[roomId] ?? false;

  LocalMessageSendState deliveryState(ChatMessageItem item) {
    final clientId = item.clientId;
    if (clientId == null) return LocalMessageSendState.sent;
    return _sendStateByTempId[clientId] ?? LocalMessageSendState.sent;
  }

  bool isSelf(ChatMessageItem item) {
    final currentUserId = _currentUser?.id;
    return currentUserId != null &&
        item.message.fromUserId == currentUserId;
  }

  // --- Lifecycle ---

  /// 设置当前用户（用于判断消息方向）
  void setCurrentUser(LoginUserVo? user) {
    _currentUser = user;
  }

  /// 初始化 WebSocket 监听
  void initWebSocketListeners() {
    _ws.addEventListener(
      'chat_provider',
      WsEventType.message,
      _onWsMessage,
    );
    _ws.addEventListener(
      'chat_provider',
      WsEventType.sessionUpdate,
      _onWsSessionUpdate,
    );
    _ws.addEventListener(
      'chat_provider',
      WsEventType.recall,
      _onWsRecall,
    );
  }

  /// 释放资源
  @override
  void dispose() {
    _ws.removeEventListener('chat_provider', WsEventType.message);
    _ws.removeEventListener('chat_provider', WsEventType.sessionUpdate);
    _ws.removeEventListener('chat_provider', WsEventType.recall);
    super.dispose();
  }

  // --- Actions ---

  /// 重置所有状态
  void resetState() {
    _sessions = [];
    _activeRoomId = null;
    _messagesByRoom.clear();
    _sessionLoading = false;
    _historyLoadingByRoom.clear();
    _hasMoreHistoryByRoom.clear();
    _sendStateByTempId.clear();
    notifyListeners();
  }

  /// 刷新会话列表
  Future<void> refreshSessions() async {
    _sessionLoading = true;
    notifyListeners();

    try {
      final result = await _chatApi.listSessions();
      _sessions = _sortSessions(result);

      final currentRoomId = _activeRoomId;
      if (currentRoomId != null &&
          _sessions.every((item) => item.roomId != currentRoomId)) {
        _activeRoomId = null;
      }
    } on ServiceException catch (e) {
      debugPrint('[ChatProvider] Refresh sessions failed: ${e.message}');
    } catch (e) {
      debugPrint('[ChatProvider] Refresh sessions failed: $e');
    } finally {
      _sessionLoading = false;
      notifyListeners();
    }
  }

  /// 打开会话
  Future<void> openSession(int roomId) async {
    _activeRoomId = roomId;
    notifyListeners();

    if (!_messagesByRoom.containsKey(roomId)) {
      await _loadHistory(roomId, reset: true);
    }
    await _markLatestMessageAsRead(roomId);
  }

  /// 加载更多历史消息
  Future<void> loadMoreHistory([int? roomId]) async {
    final targetRoomId = roomId ?? _activeRoomId;
    if (targetRoomId == null || !hasMoreHistory(targetRoomId)) return;
    await _loadHistory(targetRoomId);
  }

  /// 发送文本消息
  Future<void> sendTextMessage(String content, {int? roomId}) async {
    final targetRoomId = roomId ?? _activeRoomId;
    if (targetRoomId == null || content.trim().isEmpty) return;

    final now = DateTime.now();
    final clientId = 'local_${now.microsecondsSinceEpoch}';
    final localMessage = ChatMessageVo(
      id: -now.millisecondsSinceEpoch,
      roomId: targetRoomId,
      fromUserId: _currentUser?.id,
      fromUserName: _currentUser?.userName ?? '我',
      fromUserAvatar: _currentUser?.userAvatar,
      content: content.trim(),
      type: MessageType.text.value,
      status: MessageStatus.normal.value,
      createTime: now,
    );

    _sendStateByTempId[clientId] = LocalMessageSendState.sending;
    _prependMessage(
      targetRoomId,
      ChatMessageItem(message: localMessage, clientId: clientId, isLocalEcho: true),
    );
    notifyListeners();

    try {
      final messageId = await _messageApi.sendTextMessage(
        roomId: targetRoomId,
        content: content.trim(),
      );
      _sendStateByTempId[clientId] = LocalMessageSendState.sent;
      _replaceMessage(
        targetRoomId,
        clientId,
        ChatMessageItem(
          message: _rebuildMessage(localMessage, id: messageId),
          clientId: clientId,
          isLocalEcho: true,
        ),
      );
      notifyListeners();
      await refreshSessions();
    } on ServiceException catch (e) {
      _sendStateByTempId[clientId] = LocalMessageSendState.failed;
      notifyListeners();
      debugPrint('[ChatProvider] Send failed: ${e.message}');
    } catch (e) {
      _sendStateByTempId[clientId] = LocalMessageSendState.failed;
      notifyListeners();
      debugPrint('[ChatProvider] Send failed: $e');
    }
  }

  /// 发送图片消息
  Future<void> sendImageMessage(String imageUrl, {int? roomId}) async {
    final targetRoomId = roomId ?? _activeRoomId;
    if (targetRoomId == null || imageUrl.isEmpty) return;

    final now = DateTime.now();
    final clientId = 'local_img_${now.microsecondsSinceEpoch}';
    final localMessage = ChatMessageVo(
      id: -now.millisecondsSinceEpoch,
      roomId: targetRoomId,
      fromUserId: _currentUser?.id,
      fromUserName: _currentUser?.userName ?? '我',
      fromUserAvatar: _currentUser?.userAvatar,
      content: imageUrl,
      type: MessageType.image.value,
      status: MessageStatus.normal.value,
      createTime: now,
    );

    _sendStateByTempId[clientId] = LocalMessageSendState.sending;
    _prependMessage(
      targetRoomId,
      ChatMessageItem(message: localMessage, clientId: clientId, isLocalEcho: true),
    );
    notifyListeners();

    try {
      final messageId = await _messageApi.sendImageMessage(
        roomId: targetRoomId,
        imageUrl: imageUrl,
      );
      _sendStateByTempId[clientId] = LocalMessageSendState.sent;
      _replaceMessage(
        targetRoomId,
        clientId,
        ChatMessageItem(
          message: _rebuildMessage(localMessage, id: messageId),
          clientId: clientId,
          isLocalEcho: true,
        ),
      );
      notifyListeners();
      await refreshSessions();
    } on ServiceException catch (e) {
      _sendStateByTempId[clientId] = LocalMessageSendState.failed;
      notifyListeners();
      debugPrint('[ChatProvider] Send image failed: ${e.message}');
    } catch (e) {
      _sendStateByTempId[clientId] = LocalMessageSendState.failed;
      notifyListeners();
      debugPrint('[ChatProvider] Send image failed: $e');
    }
  }

  /// 重试发送
  Future<void> retrySend(String clientId) async {
    final target = _findLocalMessage(clientId);
    if (target == null) return;

    final roomId = target.$1;
    final item = target.$2;
    final content = item.message.content;
    if (content == null || content.trim().isEmpty) return;

    _sendStateByTempId[clientId] = LocalMessageSendState.sending;
    notifyListeners();

    try {
      final messageId = await _messageApi.sendTextMessage(
        roomId: roomId,
        content: content,
      );
      _sendStateByTempId[clientId] = LocalMessageSendState.sent;
      _replaceMessage(
        roomId,
        clientId,
        ChatMessageItem(
          message: _rebuildMessage(item.message, id: messageId),
          clientId: clientId,
          isLocalEcho: true,
        ),
      );
      notifyListeners();
      await refreshSessions();
    } on ServiceException catch (e) {
      _sendStateByTempId[clientId] = LocalMessageSendState.failed;
      notifyListeners();
      debugPrint('[ChatProvider] Retry failed: ${e.message}');
    } catch (e) {
      _sendStateByTempId[clientId] = LocalMessageSendState.failed;
      notifyListeners();
      debugPrint('[ChatProvider] Retry failed: $e');
    }
  }

  /// 置顶/取消置顶会话
  Future<void> toggleSessionTop(int roomId, bool top) async {
    try {
      await _chatApi.topSession(roomId, top);
      await refreshSessions();
    } on ServiceException catch (e) {
      debugPrint('[ChatProvider] Toggle top failed: ${e.message}');
    } catch (e) {
      debugPrint('[ChatProvider] Toggle top failed: $e');
    }
  }

  /// 删除会话
  Future<void> deleteSession(int roomId) async {
    try {
      await _chatApi.deleteSession(roomId);
      _sessions = _sessions.where((item) => item.roomId != roomId).toList();
      _messagesByRoom.remove(roomId);
      _hasMoreHistoryByRoom.remove(roomId);
      _historyLoadingByRoom.remove(roomId);

      if (_activeRoomId == roomId) _activeRoomId = null;
      notifyListeners();
    } on ServiceException catch (e) {
      debugPrint('[ChatProvider] Delete session failed: ${e.message}');
    } catch (e) {
      debugPrint('[ChatProvider] Delete session failed: $e');
    }
  }

  // --- Private Methods ---

  Future<void> _loadHistory(int roomId, {bool reset = false}) async {
    if (isHistoryLoading(roomId)) return;

    _historyLoadingByRoom[roomId] = true;
    notifyListeners();

    try {
      final existing = reset
          ? const <ChatMessageItem>[]
          : (_messagesByRoom[roomId] ?? const <ChatMessageItem>[]);
      final lastMessageId =
          !reset && existing.isNotEmpty ? existing.last.message.id : null;

      final remoteMessages = await _messageApi.listHistoryMessages(
        roomId: roomId,
        limit: _pageSize,
        lastMessageId: lastMessageId,
      );

      final normalized = _wrapRemoteMessages(
        _sortMessagesLatestFirst(remoteMessages),
      );
      final merged =
          reset ? normalized : _appendOlderMessages(existing, normalized);

      _messagesByRoom[roomId] = merged;
      _hasMoreHistoryByRoom[roomId] = remoteMessages.length >= _pageSize;
    } on ServiceException catch (e) {
      debugPrint('[ChatProvider] Load history failed: ${e.message}');
    } catch (e) {
      debugPrint('[ChatProvider] Load history failed: $e');
    } finally {
      _historyLoadingByRoom[roomId] = false;
      notifyListeners();
    }
  }

  Future<void> _markLatestMessageAsRead(int roomId) async {
    final messages = _messagesByRoom[roomId] ?? const <ChatMessageItem>[];
    ChatMessageVo? latestServerMessage;
    for (final item in messages) {
      if (item.message.id != null && item.message.id! > 0) {
        latestServerMessage = item.message;
        break;
      }
    }
    final latestMessageId = latestServerMessage?.id;
    if (latestMessageId == null) return;

    try {
      await _messageApi.markMessageRead(
        roomId: roomId,
        lastReadMessageId: latestMessageId,
      );
      await refreshSessions();
    } on ServiceException catch (e) {
      debugPrint('[ChatProvider] Mark read failed: ${e.message}');
    } catch (e) {
      debugPrint('[ChatProvider] Mark read failed: $e');
    }
  }

  // --- WebSocket Handlers ---

  void _onWsMessage(WsEvent event) {
    // 收到新消息时刷新会话列表
    refreshSessions();
  }

  void _onWsSessionUpdate(WsEvent event) {
    refreshSessions();
  }

  void _onWsRecall(WsEvent event) {
    refreshSessions();
  }

  // --- Sorting & Utility ---

  List<ChatSessionVo> _sortSessions(List<ChatSessionVo> input) {
    final sorted = List<ChatSessionVo>.from(input);
    sorted.sort((a, b) {
      final topCompare = (b.topStatus ?? 0).compareTo(a.topStatus ?? 0);
      if (topCompare != 0) return topCompare;
      final aTime = a.activeTime?.millisecondsSinceEpoch ?? 0;
      final bTime = b.activeTime?.millisecondsSinceEpoch ?? 0;
      return bTime.compareTo(aTime);
    });
    return sorted;
  }

  List<ChatMessageVo> _sortMessagesLatestFirst(List<ChatMessageVo> input) {
    final sorted = List<ChatMessageVo>.from(input);
    sorted.sort((a, b) {
      final aTime = a.createTime?.millisecondsSinceEpoch ?? 0;
      final bTime = b.createTime?.millisecondsSinceEpoch ?? 0;
      if (aTime != bTime) return bTime.compareTo(aTime);
      return (b.id ?? 0).compareTo(a.id ?? 0);
    });
    return sorted;
  }

  List<ChatMessageItem> _wrapRemoteMessages(List<ChatMessageVo> messages) {
    return messages
        .map((item) => ChatMessageItem(message: item))
        .toList(growable: false);
  }

  List<ChatMessageItem> _appendOlderMessages(
    List<ChatMessageItem> existing,
    List<ChatMessageItem> incoming,
  ) {
    final existingIds =
        existing.map((item) => item.message.id).whereType<int>().toSet();
    final deduped = incoming
        .where(
          (item) =>
              item.message.id == null || !existingIds.contains(item.message.id),
        )
        .toList();
    return [...existing, ...deduped];
  }

  void _prependMessage(int roomId, ChatMessageItem item) {
    final next = <ChatMessageItem>[
      item,
      ...(_messagesByRoom[roomId] ?? const <ChatMessageItem>[]),
    ];
    _messagesByRoom[roomId] = next;
  }

  void _replaceMessage(int roomId, String clientId, ChatMessageItem item) {
    final list = List<ChatMessageItem>.from(
      _messagesByRoom[roomId] ?? const [],
    );
    final index = list.indexWhere((entry) => entry.clientId == clientId);
    if (index == -1) return;
    list[index] = item;
    _messagesByRoom[roomId] = list;
  }

  (int, ChatMessageItem)? _findLocalMessage(String clientId) {
    for (final entry in _messagesByRoom.entries) {
      ChatMessageItem? found;
      for (final message in entry.value) {
        if (message.clientId == clientId) {
          found = message;
          break;
        }
      }
      if (found != null) return (entry.key, found);
    }
    return null;
  }

  ChatMessageVo _rebuildMessage(ChatMessageVo source, {int? id, int? status}) {
    return ChatMessageVo(
      id: id ?? source.id,
      roomId: source.roomId,
      fromUserId: source.fromUserId,
      fromUserName: source.fromUserName,
      fromUserAvatar: source.fromUserAvatar,
      content: source.content,
      type: source.type,
      extra: source.extra,
      replyMsg: source.replyMsg,
      status: status ?? source.status,
      createTime: source.createTime,
    );
  }
}
