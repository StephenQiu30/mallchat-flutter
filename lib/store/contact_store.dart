import 'package:get/get.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/api/chat/models/chat_friend_user_vo.dart';
import 'package:flutter/foundation.dart';

class ContactStore extends GetxController {
  // --- State ---
  final friends = <ChatFriendUserVo>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    refreshFriends();
  }

  /// 刷新好友列表 (从真实 API 获取)
  Future<void> refreshFriends() async {
    isLoading.value = true;
    try {
      final response = await Request.chatClient.chatFriendController.listFriends();
      if (response.code == 0 && response.data != null) {
        friends.assignAll(response.data!);
        debugPrint('[ContactStore] Friends list refreshed: ${friends.length}');
      }
    } catch (e) {
      debugPrint('[ContactStore] Failed to refresh friends: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// 计算分类 (目前 API 返回扁平列表，我们在本地做简单分类或直接展示)
  /// 如果需要按拼音排序，后续可以引入 azlist
  List<ChatFriendUserVo> get sortedFriends => friends.toList()
    ..sort((a, b) => (a.userName ?? '').compareTo(b.userName ?? ''));
}
