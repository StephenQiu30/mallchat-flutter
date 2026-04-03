import 'package:get/get.dart';

class AppController extends GetxController {
  // Navigation State
  // 0: Messages, 1: Contacts, 2: AI Assistant, 99: Settings
  var currentNavIndex = 0.obs;

  void changeNav(int index) {
    if (index == 99) return; // Maybe open settings dialog instead
    currentNavIndex.value = index;
  }
}
