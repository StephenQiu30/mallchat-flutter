import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/api/user/export.dart';
import 'package:mallchat_flutter/services/service_helpers.dart';

/// 用户相关 API 封装
/// 基于已生成的 Retrofit Client 提供高层业务接口
class UserApi {
  const UserApi();

  /// 发送邮箱验证码
  Future<void> sendEmailCode(String email) async {
    final response = await Request.userClient.userController.sendEmailCode(
      body: UserEmailCodeRequest(email: email),
    );
    requireResponseSuccess(response, fallbackMessage: '发送验证码失败');
  }

  /// 邮箱验证码登录
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

  /// 微信小程序登录
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

  /// 获取当前登录用户信息
  Future<LoginUserVo> getLoginUser() async {
    final response = await Request.userClient.userController.getLoginUser();
    return requireResponseData<LoginUserVo>(
      response,
      fallbackMessage: '获取用户资料失败',
      emptyDataMessage: '用户资料为空',
    );
  }

  /// 退出登录
  Future<void> logout() async {
    final response = await Request.userClient.userController.userLogout();
    requireResponseSuccess(response, fallbackMessage: '退出登录失败');
  }
}
