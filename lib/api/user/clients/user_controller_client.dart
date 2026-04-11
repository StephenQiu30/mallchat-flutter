// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show compute;
import 'package:retrofit/retrofit.dart';

import '../models/base_response_boolean.dart';
import '../models/base_response_list_user_vo.dart';
import '../models/base_response_login_user_vo.dart';
import '../models/base_response_long.dart';
import '../models/base_response_page_user.dart';
import '../models/base_response_page_user_vo.dart';
import '../models/base_response_user.dart';
import '../models/base_response_user_vo.dart';
import '../models/delete_request.dart';
import '../models/user_add_request.dart';
import '../models/user_app_login_request.dart';
import '../models/user_apple_login_request.dart';
import '../models/user_edit_request.dart';
import '../models/user_ma_login_request.dart';
import '../models/user_query_request.dart';
import '../models/user_update_request.dart';

part 'user_controller_client.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class UserControllerClient {
  factory UserControllerClient(Dio dio, {String? baseUrl}) =
      _UserControllerClient;

  /// 更新用户.
  ///
  /// 管理员后台更新用户信息.
  @POST('/user/update')
  Future<BaseResponseBoolean> updateUser({
    @Body() required UserUpdateRequest body,
  });

  /// 用户注销.
  ///
  /// 退出当前登录状态.
  @POST('/user/logout')
  Future<BaseResponseBoolean> userLogout();

  /// 微信小程序登录.
  ///
  /// 通过微信小程序 code 进行登录或注册.
  @POST('/user/login/ma')
  Future<BaseResponseLoginUserVo> userLoginByMa({
    @Body() required UserMaLoginRequest body,
  });

  /// Apple 登录.
  ///
  /// 通过 Apple 授权信息进行登录或注册.
  @POST('/user/login/apple')
  Future<BaseResponseLoginUserVo> userLoginByApple({
    @Body() required UserAppleLoginRequest body,
  });

  /// 微信 App 登录.
  ///
  /// 通过微信 App code 进行登录或注册.
  @POST('/user/login/app')
  Future<BaseResponseLoginUserVo> userLoginByApp({
    @Body() required UserAppLoginRequest body,
  });

  /// 分页获取用户列表.
  ///
  /// 管理员分页查询原始用户信息.
  @POST('/user/list/page')
  Future<BaseResponsePageUser> listUserByPage({
    @Body() required UserQueryRequest body,
  });

  /// 分页获取用户封装列表.
  ///
  /// 分页获取脱敏后的用户信息列表.
  @POST('/user/list/page/vo')
  Future<BaseResponsePageUserVo> listUserVoByPage({
    @Body() required UserQueryRequest body,
  });

  /// 编辑个人信息.
  ///
  /// 当前登录用户编辑自己的个人资料.
  @POST('/user/edit')
  Future<BaseResponseBoolean> editUser({@Body() required UserEditRequest body});

  /// 删除用户.
  ///
  /// 删除指定 ID 的用户（仅本人或管理员）.
  @POST('/user/delete')
  Future<BaseResponseBoolean> deleteUser({@Body() required DeleteRequest body});

  /// 创建用户.
  ///
  /// 管理员手动创建新用户.
  @POST('/user/add')
  Future<BaseResponseLong> addUser({@Body() required UserAddRequest body});

  /// 是否管理员.
  ///
  /// 返回当前登录用户是否为管理员.
  @GET('/user/is/admin')
  Future<BaseResponseBoolean> isAdmin();

  /// 根据ID获取用户.
  ///
  /// 根据用户ID获取用户详细信息（仅管理员）.
  ///
  /// [id] - 用户ID.
  @GET('/user/get')
  Future<BaseResponseUser> getUserById({@Query('id') required int id});

  /// 根据ID获取用户视图对象.
  ///
  /// 根据用户ID获取用户脱敏后的视图对象.
  ///
  /// [id] - 用户ID.
  @GET('/user/get/vo')
  Future<BaseResponseUserVo> getUserVoById({@Query('id') required int id});

  /// 批量获取用户视图对象.
  ///
  /// 根据用户ID列表批量获取用户脱敏后的视图对象.
  ///
  /// [ids] - 用户ID列表.
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
