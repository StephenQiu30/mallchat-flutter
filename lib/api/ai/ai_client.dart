// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';

import 'ai_chat_record_controller/ai_chat_record_controller_client.dart';
import 'ai_chat_controller/ai_chat_controller_client.dart';

/// MallChat Cloud API `v1.0.0`.
///
/// MallChat Cloud 微服务接口文档.
class AiClient {
  AiClient(
    Dio dio, {
    String? baseUrl,
  })  : _dio = dio,
        _baseUrl = baseUrl;

  final Dio _dio;
  final String? _baseUrl;

  static String get version => '1.0.0';

  AiChatRecordControllerClient? _aiChatRecordController;
  AiChatControllerClient? _aiChatController;

  AiChatRecordControllerClient get aiChatRecordController => _aiChatRecordController ??= AiChatRecordControllerClient(_dio, baseUrl: _baseUrl);

  AiChatControllerClient get aiChatController => _aiChatController ??= AiChatControllerClient(_dio, baseUrl: _baseUrl);
}
