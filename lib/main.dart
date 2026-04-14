import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mallchat_flutter/store/app_store.dart';
import 'package:mallchat_flutter/store/chat_store.dart';
import 'package:mallchat_flutter/store/contact_store.dart';
import 'layout/responsive_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Global Persistence
  final prefs = await SharedPreferences.getInstance();
  Get.put(prefs, permanent: true);

  // Initialize Global Stores
  Get.put(AppStore());
  Get.put(ChatStore());
  Get.put(ContactStore());
  Get.find<AppStore>().bootstrapAfterLogin();

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
        primaryColor: const Color(0xFF3B82F6),
        scaffoldBackgroundColor: const Color(0xFFF6F7F9),
        // Precise ColorScheme for prototype aesthetics
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3B82F6),
          primary: const Color(0xFF3B82F6),
          secondary: const Color(0xFFEFF6FF), // Light blue background
          surface: Colors.white,
          onSurface: const Color(0xFF1F2937), // Dark gray text
          surfaceContainerHighest: const Color(
            0xFFF3F4F6,
          ), // Message bubble light gray
        ),
        fontFamily: 'Inter',
        useMaterial3: true,
        dividerTheme: DividerThemeData(
          color: Colors.black.withValues(alpha: 0.05),
          thickness: 1,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFF1F2937),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
          iconTheme: IconThemeData(color: Color(0xFF4B5563)),
        ),
      ),
      home: const ResponsiveLayout(),
    );
  }
}
