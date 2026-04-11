import 'package:mallchat_flutter/api/user/models/login_user_vo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStore extends GetxController {
  // --- 用户状态 ---
  final userProfile = Rxn<LoginUserVo>();
  final _isLoggedIn = false.obs;
  
  bool get isLoggedIn => _isLoggedIn.value;
  String? get token => Get.find<SharedPreferences>().getString('token');

  @override
  void onInit() {
    super.onInit();
    // 初始化时从存储恢复登录状态
    _isLoggedIn.value = Get.find<SharedPreferences>().getString('token') != null;
    _isInitialized.value = true;
  }

  final _isInitialized = false.obs;
  bool get isInitialized => _isInitialized.value;

  // --- 导航状态 ---
  // 0: Messages, 1: Contacts, 2: Moments
  var currentNavIndex = 0.obs;

  void changeNav(int index) {
    currentNavIndex.value = index;
  }

  /// 保存登录信息
  void saveLoginInfo(LoginUserVo vo) {
    userProfile.value = vo;
    if (vo.token != null) {
      Get.find<SharedPreferences>().setString('token', vo.token!);
      _isLoggedIn.value = true;
    }
    update();
  }

  /// 登出并清理存储
  void logout() {
    Get.find<SharedPreferences>().remove('token');
    userProfile.value = null;
    _isLoggedIn.value = false;
    currentNavIndex.value = 0;
    // 重定向到登录页的操作由路由守卫或 UI 监听
  }
}
