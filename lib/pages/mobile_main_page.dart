import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../controllers/app_controller.dart';
import 'chat_list_page.dart';
import 'contacts_page.dart';
import 'profile_page.dart';

class MobileMainPage extends StatelessWidget {
  const MobileMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();

    const pages = [
      ChatListPage(),
      ContactsPage(),
      ProfilePage(),
    ];

    return Scaffold(
      body: Obx(() {
        final idx = appController.currentNavIndex.value;
        if (idx < pages.length) return pages[idx];
        return const ChatListPage();
      }),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: appController.currentNavIndex.value,
            onTap: appController.changeNav,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(TDIcons.chat_bubble_1),
                activeIcon: Icon(TDIcons.chat_bubble_1, color: Color(0xFF3B82F6)),
                label: "消息",
              ),
              BottomNavigationBarItem(
                icon: Icon(TDIcons.user),
                activeIcon: Icon(TDIcons.user, color: Color(0xFF3B82F6)),
                label: "联系人",
              ),
              BottomNavigationBarItem(
                icon: Icon(TDIcons.course),
                activeIcon: Icon(TDIcons.course, color: Color(0xFF3B82F6)),
                label: "动态",
              ),
            ],
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFF3B82F6),
            unselectedItemColor: const Color(0xFF9CA3AF),
            selectedFontSize: 12,
            unselectedFontSize: 12,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
