import 'package:mallchat_flutter/api/chat/export.dart';
import 'package:mallchat_flutter/api/request.dart';

import 'service_helpers.dart';

class ChatService {
  const ChatService();

  Future<List<ChatSessionVo>> listSessions() async {
    final response = await Request.chatClient.chatSessionController
        .listMySessions();
    requireResponseSuccess(response, fallbackMessage: '获取会话列表失败');
    return response.data ?? const <ChatSessionVo>[];
  }

  Future<void> topSession(int roomId, bool top) async {
    final response = await Request.chatClient.chatSessionController.topSession(
      roomId: roomId,
      status: top ? 1 : 0,
    );
    requireResponseSuccess(response, fallbackMessage: '更新置顶状态失败');
  }

  Future<void> deleteSession(int roomId) async {
    final response = await Request.chatClient.chatSessionController
        .deleteSession(body: DeleteRequest(id: roomId));
    requireResponseSuccess(response, fallbackMessage: '删除会话失败');
  }

  Future<List<ChatMessageVo>> listHistoryMessages({
    required int roomId,
    int limit = 20,
    int? lastMessageId,
  }) async {
    final response = await Request.chatClient.chatMessageController
        .listHistoryMessages(
          roomId: roomId,
          limit: limit,
          lastMessageId: lastMessageId,
        );
    requireResponseSuccess(response, fallbackMessage: '获取历史消息失败');
    return response.data ?? const <ChatMessageVo>[];
  }

  Future<int> sendTextMessage({
    required int roomId,
    required String content,
  }) async {
    final response = await Request.chatClient.chatMessageController.sendMessage(
      body: ChatMessageSendRequest(roomId: roomId, content: content, type: 1),
    );
    return requireResponseData<int>(
      response,
      fallbackMessage: '发送消息失败',
      emptyDataMessage: '消息发送结果为空',
    );
  }

  Future<void> markMessageRead({
    required int roomId,
    required int lastReadMessageId,
  }) async {
    final response = await Request.chatClient.chatMessageController
        .markMessageRead(
          body: ChatMessageReadRequest(
            roomId: roomId,
            lastReadMessageId: lastReadMessageId,
          ),
        );
    requireResponseSuccess(response, fallbackMessage: '更新已读状态失败');
  }

  Future<List<ChatFriendUserVo>> listFriends() async {
    final response = await Request.chatClient.chatFriendController
        .listFriends();
    requireResponseSuccess(response, fallbackMessage: '获取好友列表失败');
    return response.data ?? const <ChatFriendUserVo>[];
  }

  Future<PageChatFriendApplyVo> listFriendApplies({
    int current = 1,
    int pageSize = 20,
  }) async {
    final response = await Request.chatClient.chatFriendApplyController
        .listFriendApply(
          body: ChatFriendApplyQueryRequest(
            current: current,
            pageSize: pageSize,
          ),
        );
    requireResponseSuccess(response, fallbackMessage: '获取好友申请失败');
    return response.data ??
        PageChatFriendApplyVo(
          records: const <ChatFriendApplyVo>[],
          total: 0,
          size: pageSize,
          current: current,
          pages: 0,
        );
  }

  Future<void> approveFriendApply({
    required int applyId,
    required int status,
  }) async {
    final response = await Request.chatClient.chatFriendApplyController
        .approveFriend(
          body: ChatFriendApproveRequest(applyId: applyId, status: status),
        );
    requireResponseSuccess(response, fallbackMessage: '处理好友申请失败');
  }

  Future<void> applyFriend({
    required int userId,
    required String message,
  }) async {
    final response = await Request.chatClient.chatFriendApplyController
        .applyFriend(
          body: ChatFriendApplyRequest(targetId: userId, msg: message),
        );
    requireResponseSuccess(response, fallbackMessage: '发送好友申请失败');
  }

  Future<int> getOrCreatePrivateRoom(int peerUserId) async {
    final response = await Request.chatClient.chatRoomController
        .getOrCreatePrivateRoom(
          body: ChatPrivateRoomRequest(peerUserId: peerUserId),
        );
    return requireResponseData<int>(
      response,
      fallbackMessage: '创建私聊失败',
      emptyDataMessage: '私聊房间不存在',
    );
  }
}
