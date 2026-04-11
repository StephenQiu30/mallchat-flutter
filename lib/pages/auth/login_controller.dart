import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/api/user/export.dart';
import 'package:mallchat_flutter/store/app_store.dart';
import 'dart:async';

class LoginController extends GetxController {
  final appStore = Get.find<AppStore>();
  
  var isLoading = false.obs;
  var isAgreed = false.obs;

  // Email login state
  var email = ''.obs;
  var code = ''.obs;
  var timerSeconds = 0.obs;
  Timer? _timer;

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  /// 模拟登录流程
  /// 因为目前没有集成微信 SDK，先通过 Mock 方式调通流程
  Future<void> loginWithMock() async {
    if (!isAgreed.value) {
      Get.snackbar('提示', '请先同意用户协议和隐私政策', 
        snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    try {
      // 模拟网络延迟
      await Future.delayed(const Duration(seconds: 1));
      
      // 优先尝试真实 API 调用
      try {
        final response = await Request.userClient.userController.userLoginByMa(
          body: const UserMaLoginRequest(code: "test_code")
        );

        if (response.code == 0 && response.data != null) {
          appStore.saveLoginInfo(response.data!);
          return;
        }
      } catch (e) {
        debugPrint('[Auth] Real API call failed, falling back to Mock.');
      }

      // 如果真实 API 失败（如网关未启动），则进入 Mock 模式
      final mockUser = LoginUserVo(
        token: 'mock_jwt_token_for_dev_${DateTime.now().millisecondsSinceEpoch}',
        id: 999,
        userName: '测试用户',
        userAvatar: 'https://api.dicebear.com/7.x/notionists/svg?seed=Stephen',
      );
      appStore.saveLoginInfo(mockUser);
      Get.snackbar('测试模式', '已通过 Mock 登录进入系统', 
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue.withValues(alpha: 0.1));
    } finally {
      isLoading.value = false;
    }
  }

  /// 发送邮箱验证码
  Future<void> sendVerificationCode() async {
    if (email.value.isEmpty || !GetUtils.isEmail(email.value)) {
      Get.snackbar('错误', '请输入有效的邮箱地址');
      return;
    }

    if (timerSeconds.value > 0) return;

    try {
      final response = await Request.userClient.userController.sendEmailCode(
        body: UserEmailCodeRequest(email: email.value),
      );

      if (response.code == 0) {
        Get.snackbar('提交成功', '验证码已发送至您的邮箱');
        _startTimer();
      } else {
        Get.snackbar('发送失败', response.message ?? '未知错误');
      }
    } catch (e) {
      // 即使 API 报错（如未连接后端），我们也开启一个 Mock 计时器以便演示 UI 效果
      debugPrint('[Auth] Send code failed: $e. Starting mock timer.');
      _startTimer();
      Get.snackbar('提示', '后端连接失败，已开启模拟倒计时', 
        backgroundColor: Colors.orange.withValues(alpha: 0.1));
    }
  }

  /// 邮箱验证码登录
  Future<void> loginWithEmail() async {
    if (!isAgreed.value) {
      Get.snackbar('提示', '请先同意用户协议和隐私政策', 
        snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (email.value.isEmpty || code.value.isEmpty) {
      Get.snackbar('错误', '邮箱和验证码不能为空');
      return;
    }

    isLoading.value = true;
    try {
      // 尝试真实 API
      try {
        final response = await Request.userClient.userController.userLoginByEmail(
          body: UserEmailLoginRequest(email: email.value, code: code.value),
        );

        if (response.code == 0 && response.data != null) {
          appStore.saveLoginInfo(response.data!);
          return;
        }
      } catch (e) {
        debugPrint('[Auth] Email login failed, falling back to Mock.');
      }

      // Fallback to Mock
      final mockUser = LoginUserVo(
        token: 'mock_jwt_email_${DateTime.now().millisecondsSinceEpoch}',
        id: 888,
        userName: email.value.split('@').first,
        userAvatar: 'https://api.dicebear.com/7.x/notionists/svg?seed=${email.value}',
      );
      appStore.saveLoginInfo(mockUser);
      Get.snackbar('测试模式', '邮件登录 Mock 成功', 
        snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  void _startTimer() {
    timerSeconds.value = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerSeconds.value > 0) {
        timerSeconds.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  void toggleAgreement() {
    isAgreed.value = !isAgreed.value;
  }
}
