import 'dart:ui' show Size;

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mallchat_flutter/main.dart';
import 'package:mallchat_flutter/store/app_store.dart';
import 'package:mallchat_flutter/store/chat_store.dart';
import 'package:mallchat_flutter/store/contact_store.dart';

void main() {
  tearDown(() {
    Get.reset();
  });

  testWidgets('MallChatApp smoke test', (WidgetTester tester) async {
    final view = tester.view;
    view.physicalSize = const Size(400, 800);
    view.devicePixelRatio = 1.0;
    addTearDown(view.resetPhysicalSize);
    addTearDown(view.resetDevicePixelRatio);

    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    Get.put(prefs);
    Get.put(AppStore());
    Get.put(ChatStore());
    Get.put(ContactStore());

    await tester.pumpWidget(const MallChatApp());
    await tester.pumpAndSettle();

    expect(find.text('MallChat'), findsOneWidget);
  });
}
