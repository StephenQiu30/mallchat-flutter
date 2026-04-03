import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../controllers/app_controller.dart';
import 'chat_list_page.dart';

class MobileMainPage extends StatelessWidget {
  const MobileMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("MallChat"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(TDIcons.add_circle)),
        ],
      ),
      body: Obx(() {
        final idx = appController.currentNavIndex.value;
        if (idx == 0) return const ChatListPage();
        return Center(child: Text("Mobile Page $idx"));
      }),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: appController.currentNavIndex.value,
        onTap: appController.changeNav,
        items: const [
          BottomNavigationBarItem(icon: Icon(TDIcons.chat_bubble_1), label: "消息"),
          BottomNavigationBarItem(icon: Icon(TDIcons.user), label: "联系人"),
          BottomNavigationBarItem(icon: Icon(TDIcons.logo_wechat_stroke), label: "AI助手"),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
      )),
    );
  }
}
