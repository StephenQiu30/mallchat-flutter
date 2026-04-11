import 'package:flutter/material.dart';
import 'package:mallchat_flutter/pages/home/desktop_main_page.dart';
import 'package:mallchat_flutter/pages/home/mobile_main_page.dart';

import 'package:get/get.dart';
import 'package:mallchat_flutter/store/app_store.dart';
import 'package:mallchat_flutter/pages/auth/login_page.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final appStore = Get.find<AppStore>();

    return Obx(() {
      if (!appStore.isInitialized) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (!appStore.isLoggedIn) {
        return const LoginPage();
      }

      return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 800) {
            return const DesktopMainPage();
          } else {
            return const MobileMainPage();
          }
        },
      );
    });
  }
}
