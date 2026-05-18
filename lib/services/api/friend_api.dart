import 'package:mallchat_flutter/api/chat/export.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/services/service_helpers.dart';

/// 好友相关 API 封装
class FriendApi {
  const FriendApi();

  /// 获取好友列表
  Future<List<ChatFriendUserVo>> listFriends() async {
    final response =
        await Request.chatClient.chatFriendController.listFriends();
    requireResponseSuccess(response, fallbackMessage: '获取好友列表失败');
    return response.data ?? const <ChatFriendUserVo>[];
  }

  /// 直接添加好友（跳过申请流程）
  Future<void> addFriend(int userId) async {
    final response = await Request.chatClient.chatFriendController.addFriend(
      body: ChatFriendAddRequest(targetUid: userId),
    );
    requireResponseSuccess(response, fallbackMessage: '添加好友失败');
  }

  /// 获取好友申请列表
  Future<PageChatFriendApplyVo> listFriendApplies({
    int current = 1,
    int pageSize = 20,
  }) async {
    final response =
        await Request.chatClient.chatFriendApplyController.listFriendApply(
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

  /// 发送好友申请
  Future<void> applyFriend({
    required int userId,
    required String message,
  }) async {
    final response =
        await Request.chatClient.chatFriendApplyController.applyFriend(
      body: ChatFriendApplyRequest(targetId: userId, msg: message),
    );
    requireResponseSuccess(response, fallbackMessage: '发送好友申请失败');
  }

  /// 处理好友申请（同意/忽略）
  Future<void> approveFriendApply({
    required int applyId,
    required int status,
  }) async {
    final response =
        await Request.chatClient.chatFriendApplyController.approveFriend(
      body: ChatFriendApproveRequest(applyId: applyId, status: status),
    );
    requireResponseSuccess(response, fallbackMessage: '处理好友申请失败');
  }
}
