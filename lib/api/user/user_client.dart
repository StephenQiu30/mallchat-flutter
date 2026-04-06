// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';

import 'wx_mp_controller/wx_mp_controller_client.dart';
import 'user_controller/user_controller_client.dart';

/// MallChat Cloud API `v1.0.0`.
///
/// MallChat Cloud 微服务接口文档.
class UserClient {
  UserClient(
    Dio dio, {
    String? baseUrl,
  })  : _dio = dio,
        _baseUrl = baseUrl;

  final Dio _dio;
  final String? _baseUrl;

  static String get version => '1.0.0';

  WxMpControllerClient? _wxMpController;
  UserControllerClient? _userController;

  WxMpControllerClient get wxMpController => _wxMpController ??= WxMpControllerClient(_dio, baseUrl: _baseUrl);

  UserControllerClient get userController => _userController ??= UserControllerClient(_dio, baseUrl: _baseUrl);
}
