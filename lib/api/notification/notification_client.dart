// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';

import 'notification_controller/notification_controller_client.dart';

/// MallChat Cloud API `v1.0.0`.
///
/// MallChat Cloud 微服务接口文档.
class NotificationClient {
  NotificationClient(
    Dio dio, {
    String? baseUrl,
  })  : _dio = dio,
        _baseUrl = baseUrl;

  final Dio _dio;
  final String? _baseUrl;

  static String get version => '1.0.0';

  NotificationControllerClient? _notificationController;

  NotificationControllerClient get notificationController => _notificationController ??= NotificationControllerClient(_dio, baseUrl: _baseUrl);
}
