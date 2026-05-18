import 'package:mallchat_flutter/api/chat/export.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/services/service_helpers.dart';

/// 消息相关 API 封装
class MessageApi {
  const MessageApi();

  /// 获取历史消息
  Future<List<ChatMessageVo>> listHistoryMessages({
    required int roomId,
    int limit = 20,
    int? lastMessageId,
  }) async {
    final response =
        await Request.chatClient.chatMessageController.listHistoryMessages(
      roomId: roomId,
      limit: limit,
      lastMessageId: lastMessageId,
    );
    requireResponseSuccess(response, fallbackMessage: '获取历史消息失败');
    return response.data ?? const <ChatMessageVo>[];
  }

  /// 发送文本消息，返回服务端分配的消息 ID
  Future<int> sendTextMessage({
    required int roomId,
    required String content,
  }) async {
    final response =
        await Request.chatClient.chatMessageController.sendMessage(
      body: ChatMessageSendRequest(roomId: roomId, content: content, type: 1),
    );
    return requireResponseData<int>(
      response,
      fallbackMessage: '发送消息失败',
      emptyDataMessage: '消息发送结果为空',
    );
  }

  /// 发送图片消息，返回服务端分配的消息 ID
  Future<int> sendImageMessage({
    required int roomId,
    required String imageUrl,
  }) async {
    final response =
        await Request.chatClient.chatMessageController.sendMessage(
      body: ChatMessageSendRequest(
        roomId: roomId,
        content: imageUrl,
        type: 2, // MessageType.image
      ),
    );
    return requireResponseData<int>(
      response,
      fallbackMessage: '发送图片失败',
      emptyDataMessage: '图片发送结果为空',
    );
  }

  /// 上报消息已读
  Future<void> markMessageRead({
    required int roomId,
    required int lastReadMessageId,
  }) async {
    final response =
        await Request.chatClient.chatMessageController.markMessageRead(
      body: ChatMessageReadRequest(
        roomId: roomId,
        lastReadMessageId: lastReadMessageId,
      ),
    );
    requireResponseSuccess(response, fallbackMessage: '更新已读状态失败');
  }

  /// 撤回消息
  Future<void> recallMessage(int messageId) async {
    final response =
        await Request.chatClient.chatMessageController.recallMessage(
      body: DeleteRequest(id: messageId),
    );
    requireResponseSuccess(response, fallbackMessage: '撤回消息失败');
  }
}
