// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';

import 'clients/operation_log_controller_client.dart';
import 'clients/user_login_log_controller_client.dart';
import 'clients/file_upload_record_controller_client.dart';
import 'clients/api_access_log_controller_client.dart';

/// MallChat Cloud API `v1.0.0`.
///
/// MallChat Cloud 微服务接口文档.
class LogClient {
  LogClient(Dio dio, {String? baseUrl}) : _dio = dio, _baseUrl = baseUrl;

  final Dio _dio;
  final String? _baseUrl;

  static String get version => '1.0.0';

  OperationLogControllerClient? _operationLogController;
  UserLoginLogControllerClient? _userLoginLogController;
  FileUploadRecordControllerClient? _fileUploadRecordController;
  ApiAccessLogControllerClient? _apiAccessLogController;

  OperationLogControllerClient get operationLogController =>
      _operationLogController ??= OperationLogControllerClient(
        _dio,
        baseUrl: _baseUrl,
      );

  UserLoginLogControllerClient get userLoginLogController =>
      _userLoginLogController ??= UserLoginLogControllerClient(
        _dio,
        baseUrl: _baseUrl,
      );

  FileUploadRecordControllerClient get fileUploadRecordController =>
      _fileUploadRecordController ??= FileUploadRecordControllerClient(
        _dio,
        baseUrl: _baseUrl,
      );

  ApiAccessLogControllerClient get apiAccessLogController =>
      _apiAccessLogController ??= ApiAccessLogControllerClient(
        _dio,
        baseUrl: _baseUrl,
      );
}
