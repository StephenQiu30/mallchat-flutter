import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mallchat_flutter/api/chat/export.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/services/chat_service.dart';
import 'package:mallchat_flutter/services/service_exception.dart';
import 'package:mallchat_flutter/utils/app_toast.dart';

class ContactStore extends GetxController {
  static const int _pageSize = 20;

  final ChatService _chatService = const ChatService();

  final friends = <ChatFriendUserVo>[].obs;
  final friendApplies = <ChatFriendApplyVo>[].obs;
  final contactLoading = false.obs;
  final friendApplyLoading = false.obs;
  final friendApplyPage = 0.obs;
  final friendApplyHasMore = false.obs;
  final friendApplyTotal = 0.obs;

  List<ChatFriendUserVo> get sortedFriends =>
      friends.toList()
        ..sort((a, b) => (a.userName ?? '').compareTo(b.userName ?? ''));

  void resetState() {
    friends.clear();
    friendApplies.clear();
    contactLoading.value = false;
    friendApplyLoading.value = false;
    friendApplyPage.value = 0;
    friendApplyHasMore.value = false;
    friendApplyTotal.value = 0;
  }

  Future<void> refreshFriends() async {
    contactLoading.value = true;
    try {
      final result = await _chatService.listFriends();
      friends.assignAll(result);
      debugPrint('[ContactStore] Friends list refreshed: ${friends.length}');
    } on ServiceException catch (e) {
      _showError(e.message);
    } catch (e) {
      debugPrint('[ContactStore] Failed to refresh friends: $e');
    } finally {
      contactLoading.value = false;
    }
  }

  Future<void> refreshFriendApplies({bool reset = true}) async {
    if (friendApplyLoading.value) {
      return;
    }

    friendApplyLoading.value = true;
    try {
      final nextPage = reset ? 1 : friendApplyPage.value + 1;
      final result = await _chatService.listFriendApplies(
        current: nextPage,
        pageSize: _pageSize,
      );
      final records = result.records ?? const <ChatFriendApplyVo>[];
      final nextData = reset
          ? records
          : [...friendApplies, ..._dedupeApplies(friendApplies, records)];
      friendApplies.assignAll(nextData);
      friendApplyPage.value = result.current ?? nextPage;
      friendApplyTotal.value = result.total ?? friendApplies.length;
      final pages = result.pages ?? friendApplyPage.value;
      friendApplyHasMore.value = friendApplyPage.value < pages;
    } on ServiceException catch (e) {
      _showError(e.message);
    } catch (e) {
      debugPrint('[ContactStore] Failed to refresh applies: $e');
    } finally {
      friendApplyLoading.value = false;
    }
  }

  Future<void> approveFriendApply(int applyId, int status) async {
    try {
      await _chatService.approveFriendApply(applyId: applyId, status: status);
      await Future.wait([refreshFriends(), refreshFriendApplies(reset: true)]);
      _showSuccess(status == 2 ? '已通过好友申请' : '已忽略好友申请');
    } on ServiceException catch (e) {
      _showError(e.message);
    } catch (e) {
      debugPrint('[ContactStore] Failed to approve apply: $e');
    }
  }

  Future<int?> startPrivateChat(int userId) async {
    try {
      final roomId = await _chatService.getOrCreatePrivateRoom(userId);
      await Request.chat.refreshSessions();
      await Request.chat.openSession(roomId);
      return roomId;
    } on ServiceException catch (e) {
      _showError(e.message);
    } catch (e) {
      debugPrint('[ContactStore] Failed to open private room: $e');
    }
    return null;
  }

  Future<void> applyFriendByUserId(int userId, String message) async {
    try {
      await _chatService.applyFriend(userId: userId, message: message);
      _showSuccess('好友申请已发送');
      await refreshFriendApplies(reset: true);
    } on ServiceException catch (e) {
      _showError(e.message);
    } catch (e) {
      debugPrint('[ContactStore] Failed to apply friend: $e');
    }
  }

  List<ChatFriendApplyVo> _dedupeApplies(
    List<ChatFriendApplyVo> existing,
    List<ChatFriendApplyVo> incoming,
  ) {
    final existingIds = existing
        .map((item) => item.id)
        .whereType<int>()
        .toSet();
    return incoming
        .where((item) => item.id == null || !existingIds.contains(item.id))
        .toList();
  }

  void _showError(String message) {
    AppToast.showFail(message);
  }

  void _showSuccess(String message) {
    AppToast.showSuccess(message);
  }
}
