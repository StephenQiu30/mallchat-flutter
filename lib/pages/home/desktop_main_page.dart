import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mallchat_flutter/controllers/app_controller.dart';
import 'package:mallchat_flutter/components/navigation/sidebar.dart';
import 'package:mallchat_flutter/pages/chat/chat_list_page.dart';
import 'package:mallchat_flutter/pages/chat/chat_detail_page.dart';

class DesktopMainPage extends StatelessWidget {
  const DesktopMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // 1. Sidebar (Width: 68) with Glassmorphism effect
          const Sidebar(),
          
          // 2. Secondary Panel (Chat list, contacts, etc - Width: 280)
          Container(
            width: 280,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.95),
              border: Border(right: BorderSide(color: Colors.grey.shade300, width: 1)),
            ),
            child: Obx(() {
              final navIndex = Get.find<AppController>().currentNavIndex.value;
              if (navIndex == 0) return const ChatListPage();
              if (navIndex == 2) return const Center(child: Text("AI 会话列表"));
              return const Center(child: Text("通讯录"));
            }),
          ),
          
          // 3. Main Action Panel
          Expanded(
            child: Container(
              color: const Color(0xFFF3F4F7),
              child: const ChatDetailPage(),
            ),
          )
        ],
      ),
    );
  }
}
