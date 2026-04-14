import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/api/user/export.dart';

import 'service_helpers.dart';

class UserService {
  const UserService();

  Future<void> sendEmailCode(String email) async {
    final response = await Request.userClient.userController.sendEmailCode(
      body: UserEmailCodeRequest(email: email),
    );
    requireResponseSuccess(response, fallbackMessage: '发送验证码失败');
  }

  Future<LoginUserVo> loginByEmail({
    required String email,
    required String code,
  }) async {
    final response = await Request.userClient.userController.userLoginByEmail(
      body: UserEmailLoginRequest(email: email, code: code),
    );
    return requireResponseData<LoginUserVo>(
      response,
      fallbackMessage: '登录失败',
      emptyDataMessage: '登录信息为空',
    );
  }

  Future<LoginUserVo> loginByWechat(String code) async {
    final response = await Request.userClient.userController.userLoginByMa(
      body: UserMaLoginRequest(code: code),
    );
    return requireResponseData<LoginUserVo>(
      response,
      fallbackMessage: '登录失败',
      emptyDataMessage: '登录信息为空',
    );
  }

  Future<LoginUserVo> getLoginUser() async {
    final response = await Request.userClient.userController.getLoginUser();
    return requireResponseData<LoginUserVo>(
      response,
      fallbackMessage: '获取用户资料失败',
      emptyDataMessage: '用户资料为空',
    );
  }

  Future<void> logout() async {
    final response = await Request.userClient.userController.userLogout();
    requireResponseSuccess(response, fallbackMessage: '退出登录失败');
  }
}
