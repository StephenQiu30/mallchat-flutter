// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';

import 'chat_room_controller/chat_room_controller_client.dart';

/// MallChat Cloud API `v1.0.0`.
///
/// MallChat Cloud 微服务接口文档.
class ChatClient {
  ChatClient(
    Dio dio, {
    String? baseUrl,
  })  : _dio = dio,
        _baseUrl = baseUrl;

  final Dio _dio;
  final String? _baseUrl;

  static String get version => '1.0.0';

  ChatRoomControllerClient? _chatRoomController;

  ChatRoomControllerClient get chatRoomController => _chatRoomController ??= ChatRoomControllerClient(_dio, baseUrl: _baseUrl);
}
