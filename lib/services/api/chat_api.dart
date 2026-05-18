import 'package:mallchat_flutter/api/chat/export.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/services/service_helpers.dart';

/// 聊天房间/会话相关 API 封装
class ChatApi {
  const ChatApi();

  /// 获取当前用户的会话列表
  Future<List<ChatSessionVo>> listSessions() async {
    final response =
        await Request.chatClient.chatSessionController.listMySessions();
    requireResponseSuccess(response, fallbackMessage: '获取会话列表失败');
    return response.data ?? const <ChatSessionVo>[];
  }

  /// 置顶/取消置顶会话
  Future<void> topSession(int roomId, bool top) async {
    final response = await Request.chatClient.chatSessionController.topSession(
      roomId: roomId,
      status: top ? 1 : 0,
    );
    requireResponseSuccess(response, fallbackMessage: '更新置顶状态失败');
  }

  /// 删除会话
  Future<void> deleteSession(int roomId) async {
    final response =
        await Request.chatClient.chatSessionController.deleteSession(
      body: DeleteRequest(id: roomId),
    );
    requireResponseSuccess(response, fallbackMessage: '删除会话失败');
  }

  /// 获取或创建私聊房间
  Future<int> getOrCreatePrivateRoom(int peerUserId) async {
    final response =
        await Request.chatClient.chatRoomController.getOrCreatePrivateRoom(
      body: ChatPrivateRoomRequest(peerUserId: peerUserId),
    );
    return requireResponseData<int>(
      response,
      fallbackMessage: '创建私聊失败',
      emptyDataMessage: '私聊房间不存在',
    );
  }

  /// 获取当前用户的聊天室列表
  Future<List<ChatRoomVo>> listChatRooms() async {
    final response =
        await Request.chatClient.chatRoomController.listUserChatRooms();
    requireResponseSuccess(response, fallbackMessage: '获取聊天室列表失败');
    return response.data ?? const <ChatRoomVo>[];
  }
}
