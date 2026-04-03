import 'dart:ui' show Size;

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:mallchat_flutter/controllers/app_controller.dart';
import 'package:mallchat_flutter/controllers/chat_controller.dart';
import 'package:mallchat_flutter/main.dart';

class _TestChatController extends ChatController {
  @override
  void onInit() {
    super.onInit();
    chatRooms.clear();
    currentMessages.clear();
    activeRoomId.value = '';
  }
}

void main() {
  tearDown(Get.reset);

  testWidgets('MallChatApp smoke test', (WidgetTester tester) async {
    final view = tester.view;
    view.physicalSize = const Size(400, 800);
    view.devicePixelRatio = 1.0;
    addTearDown(view.resetPhysicalSize);
    addTearDown(view.resetDevicePixelRatio);

    Get.put(AppController());
    Get.put<ChatController>(_TestChatController());
    await tester.pumpWidget(const MallChatApp());
    await tester.pumpAndSettle();
    expect(find.text('MallChat'), findsOneWidget);
  });
}
