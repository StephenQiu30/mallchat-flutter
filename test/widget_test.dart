import 'dart:ui' show Size;

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:mallchat_flutter/store/app_store.dart';
import 'package:mallchat_flutter/store/chat_store.dart';
import 'package:mallchat_flutter/main.dart';

class _TestChatStore extends ChatStore {
  @override
  void onInit() {
    super.onInit();
    chatRooms.clear();
    currentMessages.clear();
    activeRoomId.value = null;
  }
}

void main() {
  tearDown(Get.clearRouteTree);

  testWidgets('MallChatApp smoke test', (WidgetTester tester) async {
    final view = tester.view;
    view.physicalSize = const Size(400, 800);
    view.devicePixelRatio = 1.0;
    addTearDown(view.resetPhysicalSize);
    addTearDown(view.resetDevicePixelRatio);

    Get.put(AppStore());
    Get.put<ChatStore>(_TestChatStore());
    await tester.pumpWidget(const MallChatApp());
    await tester.pumpAndSettle();
    expect(find.text('MallChat'), findsOneWidget);
  });
}
