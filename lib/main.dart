import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/app_controller.dart';
import 'controllers/chat_controller.dart';
import 'layout/responsive_layout.dart';

void main() {
  // Initialize GetX Controllers globally
  Get.put(AppController());
  Get.put(ChatController());

  runApp(const MallChatApp());
}

class MallChatApp extends StatelessWidget {
  const MallChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MallChat Cloud',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF0052D9),
        scaffoldBackgroundColor: const Color(0xFFF6F7F9),
        // Use TDesign tokens for typography and colors
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0052D9),
          primary: const Color(0xFF0052D9),
          secondary: const Color(0xFFE3E9FF),
          surface: Colors.white,
        ),
        fontFamily: 'Inter', // Ensure Inter or Roboto is used if possible
        useMaterial3: true,
        dividerColor: Colors.grey.withValues(alpha: 0.1),
      ),
      home: const ResponsiveLayout(),

    );
  }
}
