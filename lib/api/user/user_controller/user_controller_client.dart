// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_response_boolean.dart';
import '../models/base_response_list_user_vo.dart';
import '../models/base_response_login_user_vo.dart';
import '../models/base_response_long.dart';
import '../models/base_response_page_user.dart';
import '../models/base_response_page_user_vo.dart';
import '../models/base_response_string.dart';
import '../models/base_response_user.dart';
import '../models/base_response_user_vo.dart';
import '../models/base_response_wx_login_response.dart';
import '../models/delete_request.dart';
import '../models/git_hub_callback_request.dart';
import '../models/git_hub_login_request.dart';
import '../models/user_add_request.dart';
import '../models/user_edit_request.dart';
import '../models/user_query_request.dart';
import '../models/user_update_request.dart';

part 'user_controller_client.g.dart';

@RestApi()
abstract class UserControllerClient {
  factory UserControllerClient(Dio dio, {String? baseUrl}) = _UserControllerClient;

  @POST('/user/update')
  Future<BaseResponseBoolean> updateUser({
    @Body() required UserUpdateRequest body,
  });

  /// 用户注销.
  ///
  /// 退出当前登录状态.
  @POST('/user/logout')
  Future<BaseResponseBoolean> userLogout();

  /// 获取 GitHub 授权 URL.
  ///
  /// 获取跳转到 GitHub 授权页面的 URL.
  @GET('/user/login/github')
  Future<BaseResponseString> getGitHubAuthorizeUrl();

  /// GitHub 登录.
  ///
  /// 通过 GitHub 授权码进行登录或注册.
  @POST('/user/login/github')
  Future<BaseResponseLoginUserVo> userLoginByGitHub({
    @Body() required GitHubLoginRequest body,
  });

  @POST('/user/list/page')
  Future<BaseResponsePageUser> listUserByPage({
    @Body() required UserQueryRequest body,
  });

  @POST('/user/list/page/vo')
  Future<BaseResponsePageUserVo> listUserVoByPage({
    @Body() required UserQueryRequest body,
  });

  @POST('/user/edit')
  Future<BaseResponseBoolean> editUser({
    @Body() required UserEditRequest body,
  });

  @POST('/user/delete')
  Future<BaseResponseBoolean> deleteUser({
    @Body() required DeleteRequest body,
  });

  @POST('/user/add')
  Future<BaseResponseLong> addUser({
    @Body() required UserAddRequest body,
  });

  /// 检查微信登录状态.
  ///
  /// 轮询检查微信扫码登录状态.
  @GET('/user/login/wx/status')
  Future<BaseResponseLoginUserVo> checkWxLoginStatus({
    @Query('sceneId') required String sceneId,
  });

  @GET('/user/login/wx/qrcode')
  Future<BaseResponseWxLoginResponse> getWxLoginQrCode();

  @GET('/user/login/github/callback')
  Future<BaseResponseLoginUserVo> gitHubLoginCallback({
    @Query('request') required GitHubCallbackRequest request,
  });

  /// 是否管理员.
  ///
  /// 返回当前登录用户是否为管理员.
  @GET('/user/is/admin')
  Future<BaseResponseBoolean> isAdmin();

  @GET('/user/get')
  Future<BaseResponseUser> getUserById({
    @Query('id') required int id,
  });

  @GET('/user/get/vo')
  Future<BaseResponseUserVo> getUserVoById({
    @Query('id') required int id,
  });

  @GET('/user/get/vo/batch')
  Future<BaseResponseListUserVo> getUserVoByIds({
    @Query('ids') required List<int> ids,
  });

  /// 获取当前登录用户.
  ///
  /// 获取系统当前登录的用户信息.
  @GET('/user/get/login')
  Future<BaseResponseLoginUserVo> getLoginUser();
}
