import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class AppToast {
  const AppToast._();

  static void showText(String message) {
    _show(message, (context) => TDToast.showText(message, context: context));
  }

  static void showSuccess(String message) {
    _show(message, (context) => TDToast.showSuccess(message, context: context));
  }

  static void showWarning(String message) {
    _show(message, (context) => TDToast.showWarning(message, context: context));
  }

  static void showFail(String message) {
    _show(message, (context) => TDToast.showFail(message, context: context));
  }

  static void _show(
    String message,
    void Function(BuildContext context) presenter,
  ) {
    final context = _resolveContext();
    if (context == null) {
      debugPrint('[Toast Fallback] $message');
      return;
    }

    presenter(context);
  }

  static BuildContext? _resolveContext() {
    final navigatorOverlayContext = Get.key.currentState?.overlay?.context;
    final candidates = <BuildContext?>[
      navigatorOverlayContext,
      Get.key.currentContext,
      Get.overlayContext,
      Get.context,
    ];

    for (final context in candidates) {
      if (context == null) {
        continue;
      }
      if (Overlay.maybeOf(context, rootOverlay: true) != null) {
        return context;
      }
    }
    return null;
  }
}
