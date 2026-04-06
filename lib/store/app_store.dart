import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStore extends GetxController {
  // Navigation State
  // 0: Messages, 1: Contacts, 2: Moments
  var currentNavIndex = 0.obs;

  void changeNav(int index) {
    currentNavIndex.value = index;
  }

  /// 登出并清理存储
  void logout() {
    Get.find<SharedPreferences>().remove('token');
    // 跳转登录页逻辑可在此扩展
  }
}
