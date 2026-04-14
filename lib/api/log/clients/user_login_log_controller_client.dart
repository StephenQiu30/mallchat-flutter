// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show compute;
import 'package:retrofit/retrofit.dart';

import '../models/base_response_boolean.dart';
import '../models/base_response_page_user_login_log_vo.dart';
import '../models/delete_request.dart';
import '../models/user_login_log_add_request.dart';
import '../models/user_login_log_query_request.dart';

part 'user_login_log_controller_client.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class UserLoginLogControllerClient {
  factory UserLoginLogControllerClient(Dio dio, {String? baseUrl}) =
      _UserLoginLogControllerClient;

  /// 分页获取用户登录日志列表.
  ///
  /// 分页查询用户登录日志（仅管理员）.
  @POST('/log/login/list/page')
  Future<BaseResponsePageUserLoginLogVo> listLogByPage1({
    @Body() required UserLoginLogQueryRequest body,
  });

  /// 删除用户登录日志.
  ///
  /// 删除指定用户登录日志（仅管理员）.
  @POST('/log/login/delete')
  Future<BaseResponseBoolean> deleteUserLoginLog({
    @Body() required DeleteRequest body,
  });

  /// 创建用户登录日志.
  ///
  /// 记录用户登录日志.
  @POST('/log/login/add')
  Future<BaseResponseBoolean> addUserLoginLog({
    @Body() required UserLoginLogAddRequest body,
  });
}
