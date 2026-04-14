import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/components/navigation/sidebar.dart';
import 'package:mallchat_flutter/pages/chat/chat_detail_page.dart';
import 'package:mallchat_flutter/pages/chat/chat_list_page.dart';
import 'package:mallchat_flutter/pages/contacts/contacts_page.dart';
import 'package:mallchat_flutter/pages/profile/profile_page.dart';

class DesktopMainPage extends StatelessWidget {
  const DesktopMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final navIndex = Request.app.currentNavIndex.value;

        if (navIndex == 1) {
          return const Row(
            children: [
              Sidebar(),
              Expanded(child: ContactsPage()),
            ],
          );
        }

        if (navIndex == 2) {
          return const Row(
            children: [
              Sidebar(),
              Expanded(child: ProfilePage()),
            ],
          );
        }

        return Row(
          children: [
            const Sidebar(),
            Container(
              width: 320,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.95),
                border: Border(
                  right: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: const ChatListPage(),
            ),
            const Expanded(
              child: ColoredBox(
                color: Color(0xFFF3F4F7),
                child: ChatDetailPage(),
              ),
            ),
          ],
        );
      }),
    );
  }
}
