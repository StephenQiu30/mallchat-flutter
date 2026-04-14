import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mallchat_flutter/api/chat/export.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/common/enums.dart';
import 'package:mallchat_flutter/models/chat_message_item.dart';
import 'package:mallchat_flutter/services/chat_service.dart';
import 'package:mallchat_flutter/services/service_exception.dart';
import 'package:mallchat_flutter/utils/app_toast.dart';

class ChatStore extends GetxController {
  static const int _pageSize = 20;

  final ChatService _chatService = const ChatService();

  final sessions = <ChatSessionVo>[].obs;
  final activeRoomId = RxnInt();
  final messagesByRoom = <int, List<ChatMessageItem>>{}.obs;
  final sessionLoading = false.obs;
  final historyLoadingByRoom = <int, bool>{}.obs;
  final hasMoreHistoryByRoom = <int, bool>{}.obs;
  final sendStateByTempId = <String, LocalMessageSendState>{}.obs;

  ChatSessionVo? get activeSession =>
      sessions.firstWhereOrNull((item) => item.roomId == activeRoomId.value);

  List<ChatMessageItem> get activeMessages {
    final roomId = activeRoomId.value;
    if (roomId == null) {
      return const <ChatMessageItem>[];
    }
    return List<ChatMessageItem>.unmodifiable(
      messagesByRoom[roomId] ?? const [],
    );
  }

  int get totalUnreadCount =>
      sessions.fold<int>(0, (sum, item) => sum + (item.unreadCount ?? 0));

  String? get unreadBadgeLabel {
    if (totalUnreadCount <= 0) {
      return null;
    }
    if (totalUnreadCount > 99) {
      return '99+';
    }
    return totalUnreadCount.toString();
  }

  bool isHistoryLoading(int roomId) => historyLoadingByRoom[roomId] ?? false;

  bool hasMoreHistory(int roomId) => hasMoreHistoryByRoom[roomId] ?? false;

  LocalMessageSendState deliveryState(ChatMessageItem item) {
    final clientId = item.clientId;
    if (clientId == null) {
      return LocalMessageSendState.sent;
    }
    return sendStateByTempId[clientId] ?? LocalMessageSendState.sent;
  }

  bool isSelf(ChatMessageItem item) {
    final currentUserId = Request.app.userProfile.value?.id;
    return currentUserId != null && item.message.fromUserId == currentUserId;
  }

  void resetState() {
    sessions.clear();
    activeRoomId.value = null;
    messagesByRoom.clear();
    sessionLoading.value = false;
    historyLoadingByRoom.clear();
    hasMoreHistoryByRoom.clear();
    sendStateByTempId.clear();
  }

  Future<void> refreshSessions() async {
    sessionLoading.value = true;
    try {
      final result = await _chatService.listSessions();
      sessions.assignAll(_sortSessions(result));

      final currentRoomId = activeRoomId.value;
      if (currentRoomId != null &&
          sessions.firstWhereOrNull((item) => item.roomId == currentRoomId) ==
              null) {
        activeRoomId.value = null;
      }
    } on ServiceException catch (e) {
      _showError(e.message);
    } catch (e) {
      debugPrint('[ChatStore] Failed to refresh sessions: $e');
    } finally {
      sessionLoading.value = false;
    }
  }

  Future<void> openSession(int roomId) async {
    activeRoomId.value = roomId;
    if (!messagesByRoom.containsKey(roomId)) {
      await _loadHistory(roomId, reset: true);
    }
    await _markLatestMessageAsRead(roomId);
  }

  Future<void> loadMoreHistory([int? roomId]) async {
    final targetRoomId = roomId ?? activeRoomId.value;
    if (targetRoomId == null || !hasMoreHistory(targetRoomId)) {
      return;
    }
    await _loadHistory(targetRoomId);
  }

  Future<void> sendTextMessage(String content, {int? roomId}) async {
    final targetRoomId = roomId ?? activeRoomId.value;
    if (targetRoomId == null || content.trim().isEmpty) {
      return;
    }

    final now = DateTime.now();
    final currentUser = Request.app.userProfile.value;
    final clientId = 'local_${now.microsecondsSinceEpoch}';
    final localMessage = ChatMessageVo(
      id: -now.millisecondsSinceEpoch,
      roomId: targetRoomId,
      fromUserId: currentUser?.id,
      fromUserName: currentUser?.userName ?? '我',
      fromUserAvatar: currentUser?.userAvatar,
      content: content.trim(),
      type: MessageType.text.value,
      status: MessageStatus.normal.value,
      createTime: now,
    );

    sendStateByTempId[clientId] = LocalMessageSendState.sending;
    _prependMessage(
      targetRoomId,
      ChatMessageItem(
        message: localMessage,
        clientId: clientId,
        isLocalEcho: true,
      ),
    );

    try {
      final messageId = await _chatService.sendTextMessage(
        roomId: targetRoomId,
        content: content.trim(),
      );
      sendStateByTempId[clientId] = LocalMessageSendState.sent;
      _replaceMessage(
        targetRoomId,
        clientId,
        ChatMessageItem(
          message: _rebuildMessage(localMessage, id: messageId),
          clientId: clientId,
          isLocalEcho: true,
        ),
      );
      await refreshSessions();
    } on ServiceException catch (e) {
      sendStateByTempId[clientId] = LocalMessageSendState.failed;
      _showError(e.message);
    } catch (e) {
      sendStateByTempId[clientId] = LocalMessageSendState.failed;
      debugPrint('[ChatStore] Failed to send message: $e');
    }
  }

  Future<void> retrySend(String clientId) async {
    final target = _findLocalMessage(clientId);
    if (target == null) {
      return;
    }

    final roomId = target.$1;
    final item = target.$2;
    final content = item.message.content;
    if (content == null || content.trim().isEmpty) {
      return;
    }

    sendStateByTempId[clientId] = LocalMessageSendState.sending;
    try {
      final messageId = await _chatService.sendTextMessage(
        roomId: roomId,
        content: content,
      );
      sendStateByTempId[clientId] = LocalMessageSendState.sent;
      _replaceMessage(
        roomId,
        clientId,
        ChatMessageItem(
          message: _rebuildMessage(item.message, id: messageId),
          clientId: clientId,
          isLocalEcho: true,
        ),
      );
      await refreshSessions();
    } on ServiceException catch (e) {
      sendStateByTempId[clientId] = LocalMessageSendState.failed;
      _showError(e.message);
    } catch (e) {
      sendStateByTempId[clientId] = LocalMessageSendState.failed;
      debugPrint('[ChatStore] Failed to retry message: $e');
    }
  }

  Future<void> toggleSessionTop(int roomId, bool top) async {
    try {
      await _chatService.topSession(roomId, top);
      await refreshSessions();
    } on ServiceException catch (e) {
      _showError(e.message);
    } catch (e) {
      debugPrint('[ChatStore] Failed to toggle top: $e');
    }
  }

  Future<void> deleteSession(int roomId) async {
    try {
      await _chatService.deleteSession(roomId);
      sessions.removeWhere((item) => item.roomId == roomId);
      messagesByRoom.remove(roomId);
      hasMoreHistoryByRoom.remove(roomId);
      historyLoadingByRoom.remove(roomId);

      if (activeRoomId.value == roomId) {
        activeRoomId.value = null;
      }
    } on ServiceException catch (e) {
      _showError(e.message);
    } catch (e) {
      debugPrint('[ChatStore] Failed to delete session: $e');
    }
  }

  Future<void> _loadHistory(int roomId, {bool reset = false}) async {
    if (isHistoryLoading(roomId)) {
      return;
    }

    historyLoadingByRoom[roomId] = true;
    try {
      final existing = reset
          ? const <ChatMessageItem>[]
          : (messagesByRoom[roomId] ?? const <ChatMessageItem>[]);
      final lastMessageId = !reset && existing.isNotEmpty
          ? existing.last.message.id
          : null;
      final remoteMessages = await _chatService.listHistoryMessages(
        roomId: roomId,
        limit: _pageSize,
        lastMessageId: lastMessageId,
      );
      final normalized = _wrapRemoteMessages(
        _sortMessagesLatestFirst(remoteMessages),
      );
      final merged = reset
          ? normalized
          : _appendOlderMessages(existing, normalized);

      messagesByRoom[roomId] = merged;
      hasMoreHistoryByRoom[roomId] = remoteMessages.length >= _pageSize;
    } on ServiceException catch (e) {
      _showError(e.message);
    } catch (e) {
      debugPrint('[ChatStore] Failed to load history: $e');
    } finally {
      historyLoadingByRoom[roomId] = false;
    }
  }

  Future<void> _markLatestMessageAsRead(int roomId) async {
    final messages = messagesByRoom[roomId] ?? const <ChatMessageItem>[];
    final latestServerMessage = messages.firstWhereOrNull(
      (item) => item.message.id != null && item.message.id! > 0,
    );
    final latestMessageId = latestServerMessage?.message.id;
    if (latestMessageId == null) {
      return;
    }

    try {
      await _chatService.markMessageRead(
        roomId: roomId,
        lastReadMessageId: latestMessageId,
      );
      await refreshSessions();
    } on ServiceException catch (e) {
      debugPrint('[ChatStore] Mark read failed: ${e.message}');
    } catch (e) {
      debugPrint('[ChatStore] Mark read failed: $e');
    }
  }

  List<ChatSessionVo> _sortSessions(List<ChatSessionVo> input) {
    final sorted = List<ChatSessionVo>.from(input);
    sorted.sort((a, b) {
      final topCompare = (b.topStatus ?? 0).compareTo(a.topStatus ?? 0);
      if (topCompare != 0) {
        return topCompare;
      }

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
      if (aTime != bTime) {
        return bTime.compareTo(aTime);
      }
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
    final existingIds = existing
        .map((item) => item.message.id)
        .whereType<int>()
        .toSet();
    final deduped = incoming
        .where(
          (item) =>
              item.message.id == null || !existingIds.contains(item.message.id),
        )
        .toList();
    return [...existing, ...deduped];
  }

  void _prependMessage(int roomId, ChatMessageItem item) {
    final next = [
      item,
      ...(messagesByRoom[roomId] ?? const <ChatMessageItem>[]),
    ];
    messagesByRoom[roomId] = next;
  }

  void _replaceMessage(int roomId, String clientId, ChatMessageItem item) {
    final list = List<ChatMessageItem>.from(messagesByRoom[roomId] ?? const []);
    final index = list.indexWhere((entry) => entry.clientId == clientId);
    if (index == -1) {
      return;
    }
    list[index] = item;
    messagesByRoom[roomId] = list;
  }

  (int, ChatMessageItem)? _findLocalMessage(String clientId) {
    for (final entry in messagesByRoom.entries) {
      final item = entry.value.firstWhereOrNull(
        (message) => message.clientId == clientId,
      );
      if (item != null) {
        return (entry.key, item);
      }
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

  void _showError(String message) {
    AppToast.showFail(message);
  }
}
