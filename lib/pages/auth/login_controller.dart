import 'package:get/get.dart';
import 'dart:async';

import 'package:mallchat_flutter/services/service_exception.dart';
import 'package:mallchat_flutter/services/user_service.dart';
import 'package:mallchat_flutter/store/app_store.dart';
import 'package:mallchat_flutter/utils/app_toast.dart';

class LoginController extends GetxController {
  final appStore = Get.find<AppStore>();
  final UserService _userService = const UserService();

  var isLoading = false.obs;
  var isAgreed = false.obs;

  // Email login state
  var email = ''.obs;
  var code = ''.obs;
  var isSendingCode = false.obs;
  var timerSeconds = 0.obs;
  Timer? _timer;

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  /// 微信一键登录
  Future<void> loginWithWechat() async {
    if (!isAgreed.value) {
      AppToast.showText('请先同意用户协议和隐私政策');
      return;
    }

    isLoading.value = true;
    try {
      final loginUser = await _userService.loginByWechat('test_code');
      appStore.saveLoginInfo(loginUser);
      await appStore.bootstrapAfterLogin();
      AppToast.showSuccess('登录成功');
    } on ServiceException catch (e) {
      AppToast.showFail(e.message);
    } catch (e) {
      AppToast.showFail('网络连接失败');
    } finally {
      isLoading.value = false;
    }
  }

  /// 发送邮箱验证码
  Future<void> sendVerificationCode() async {
    if (email.value.isEmpty || !GetUtils.isEmail(email.value)) {
      AppToast.showWarning('请输入有效的邮箱地址');
      return;
    }

    if (timerSeconds.value > 0 || isSendingCode.value) return;

    isSendingCode.value = true;
    try {
      await _userService.sendEmailCode(email.value);
      AppToast.showSuccess('验证码已发送');
      _startTimer();
    } on ServiceException catch (e) {
      AppToast.showFail(e.message);
    } catch (e) {
      AppToast.showFail('网络错误');
    } finally {
      isSendingCode.value = false;
    }
  }

  /// 邮箱验证码登录
  Future<void> loginWithEmail() async {
    if (!isAgreed.value) {
      AppToast.showText('请先同意用户协议和隐私政策');
      return;
    }

    if (email.value.isEmpty || code.value.isEmpty) {
      AppToast.showWarning('邮箱和验证码不能为空');
      return;
    }

    isLoading.value = true;
    try {
      final loginUser = await _userService.loginByEmail(
        email: email.value,
        code: code.value,
      );
      appStore.saveLoginInfo(loginUser);
      await appStore.bootstrapAfterLogin();
      AppToast.showSuccess('欢迎回来');
    } on ServiceException catch (e) {
      AppToast.showFail(e.message);
    } catch (e) {
      AppToast.showFail('网络连接由于服务端原因已断开');
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
