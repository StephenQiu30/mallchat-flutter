import 'package:get/get.dart';

class AppController extends GetxController {
  // Navigation State
  // 0: Messages, 1: Contacts, 2: Moments
  var currentNavIndex = 0.obs;

  void changeNav(int index) {
    currentNavIndex.value = index;
  }
}
