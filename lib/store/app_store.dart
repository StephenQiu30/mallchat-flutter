import 'dart:convert';

import 'package:mallchat_flutter/api/user/models/login_user_vo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:flutter/foundation.dart';
import 'package:mallchat_flutter/services/service_exception.dart';
import 'package:mallchat_flutter/services/user_service.dart';
import 'package:mallchat_flutter/store/chat_store.dart';
import 'package:mallchat_flutter/store/contact_store.dart';

class AppStore extends GetxController {
  final UserService _userService = const UserService();

  final userProfile = Rxn<LoginUserVo>();
  final _isLoggedIn = false.obs;
  bool get isLoggedIn => _isLoggedIn.value;

  final _isInitialized = false.obs;
  bool get isInitialized => _isInitialized.value;

  final _isBootstrapping = false.obs;
  bool get isBootstrapping => _isBootstrapping.value;

  String? get token => Get.find<SharedPreferences>().getString('token');
  var currentNavIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    final prefs = Get.find<SharedPreferences>();

    final savedToken = prefs.getString('token');
    final savedProfile = prefs.getString('user_profile');

    if (savedToken != null && savedToken.isNotEmpty) {
      _isLoggedIn.value = true;
      if (savedProfile != null) {
        try {
          userProfile.value = LoginUserVo.fromJson(jsonDecode(savedProfile));
        } catch (e) {
          logoutLocal();
        }
      }
    }

    _isInitialized.value = true;
  }

  Future<void> bootstrapAfterLogin({bool refreshUser = true}) async {
    if (!isLoggedIn || _isBootstrapping.value) {
      return;
    }

    _isBootstrapping.value = true;
    try {
      if (refreshUser) {
        final profile = await _userService.getLoginUser();
        saveLoginInfo(profile);
      }

      await Future.wait([
        Request.chat.refreshSessions(),
        Request.contact.refreshFriends(),
        Request.contact.refreshFriendApplies(reset: true),
      ]);
    } on ServiceException catch (e) {
      debugPrint('[AppStore] Bootstrap failed: ${e.message}');
      if (e.message.contains('401') || e.message.contains('登录')) {
        logoutLocal();
      }
    } catch (e) {
      debugPrint('[AppStore] Bootstrap failed: $e');
    } finally {
      _isBootstrapping.value = false;
    }
  }

  Future<void> refreshUserProfile() async {
    if (!isLoggedIn) return;

    try {
      final profile = await _userService.getLoginUser();
      saveLoginInfo(profile);
      debugPrint('[AppStore] Profile refreshed successfully.');
    } on ServiceException catch (e) {
      debugPrint('[AppStore] Profile refresh failed: ${e.message}');
      if (e.message.contains('401') || e.message.contains('登录')) {
        logoutLocal();
      }
    } catch (e) {
      debugPrint('[AppStore] Profile refresh failed: $e');
    }
  }

  void changeNav(int index) {
    currentNavIndex.value = index;
  }

  void saveLoginInfo(LoginUserVo vo) {
    final mergedProfile = _mergeProfile(vo);
    userProfile.value = mergedProfile;

    final prefs = Get.find<SharedPreferences>();

    final nextToken = mergedProfile.token;
    if (nextToken != null && nextToken.isNotEmpty) {
      prefs.setString('token', nextToken);
    }

    prefs.setString('user_profile', jsonEncode(mergedProfile.toJson()));
    _isLoggedIn.value = true;
    update();
  }

  Future<void> logoutRemote() async {
    try {
      await _userService.logout();
    } catch (e) {
      debugPrint('[AppStore] Remote logout failed: $e');
    } finally {
      logoutLocal();
    }
  }

  void logoutLocal() {
    final prefs = Get.find<SharedPreferences>();
    prefs.remove('token');
    prefs.remove('user_profile');

    userProfile.value = null;
    _isLoggedIn.value = false;
    currentNavIndex.value = 0;

    if (Get.isRegistered<ChatStore>()) {
      Get.find<ChatStore>().resetState();
    }
    if (Get.isRegistered<ContactStore>()) {
      Get.find<ContactStore>().resetState();
    }
  }

  LoginUserVo _mergeProfile(LoginUserVo incoming) {
    final current = userProfile.value;
    if (current == null) {
      return incoming;
    }

    return LoginUserVo(
      id: incoming.id ?? current.id,
      userName: incoming.userName ?? current.userName,
      userAvatar: incoming.userAvatar ?? current.userAvatar,
      userRole: incoming.userRole ?? current.userRole,
      userProfile: incoming.userProfile ?? current.userProfile,
      userPhone: incoming.userPhone ?? current.userPhone,
      userEmail: incoming.userEmail ?? current.userEmail,
      lastLoginTime: incoming.lastLoginTime ?? current.lastLoginTime,
      createTime: incoming.createTime ?? current.createTime,
      updateTime: incoming.updateTime ?? current.updateTime,
      token: incoming.token ?? current.token ?? token,
    );
  }
}
