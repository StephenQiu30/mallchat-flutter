import 'dart:convert';
import 'package:mallchat_flutter/api/user/models/login_user_vo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:flutter/foundation.dart';

class AppStore extends GetxController {
  // --- 用户状态 ---
  final userProfile = Rxn<LoginUserVo>();
  final _isLoggedIn = false.obs;
  
  bool get isLoggedIn => _isLoggedIn.value;
  String? get token => Get.find<SharedPreferences>().getString('token');

  @override
  void onInit() {
    super.onInit();
    final prefs = Get.find<SharedPreferences>();
    
    // 初始化时从存储恢复登录状态和用户信息
    final savedToken = prefs.getString('token');
    final savedProfile = prefs.getString('user_profile');
    
    if (savedToken != null) {
      _isLoggedIn.value = true;
      if (savedProfile != null) {
        try {
          userProfile.value = LoginUserVo.fromJson(jsonDecode(savedProfile));
          // 异步刷新用户信息以获取最新状态
          refreshUserProfile();
        } catch (e) {
          logout();
        }
      }
    }
    
    _isInitialized.value = true;
  }

  final _isInitialized = false.obs;
  bool get isInitialized => _isInitialized.value;

  /// 从服务端刷新用户信息
  Future<void> refreshUserProfile() async {
    if (!isLoggedIn) return;
    
    try {
      final response = await Request.userClient.userController.getLoginUser();
      if (response.code == 0 && response.data != null) {
        // 更新本地存储和状态
        saveLoginInfo(response.data!);
        debugPrint('[AppStore] Profile refreshed successfully.');
        
        // 联动刷新聊天和好友数据
        Request.chat.refreshRooms();
        Request.contact.refreshFriends();
      } else if (response.code == 401) {
        // Token 失效
        logout();
      }
    } catch (e) {
      debugPrint('[AppStore] Profile refresh failed: $e');
    }
  }

  // --- 导航状态 ---
  // 0: Messages, 1: Contacts, 2: Moments
  var currentNavIndex = 0.obs;

  void changeNav(int index) {
    currentNavIndex.value = index;
  }

  /// 保存登录信息
  void saveLoginInfo(LoginUserVo vo) {
    userProfile.value = vo;
    final prefs = Get.find<SharedPreferences>();
    
    if (vo.token != null) {
      prefs.setString('token', vo.token!);
      prefs.setString('user_profile', jsonEncode(vo.toJson()));
      _isLoggedIn.value = true;
    }
    update();
  }

  /// 登出并清理存储
  void logout() {
    final prefs = Get.find<SharedPreferences>();
    prefs.remove('token');
    prefs.remove('user_profile');
    userProfile.value = null;
    _isLoggedIn.value = false;
    currentNavIndex.value = 0;
  }
}
