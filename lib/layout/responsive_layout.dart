import 'package:flutter/material.dart';
import '../pages/desktop_main_page.dart';
import '../pages/mobile_main_page.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 800) {
          return const DesktopMainPage();
        } else {
          return const MobileMainPage();
        }
      },
    );
  }
}
