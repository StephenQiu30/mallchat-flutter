// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';

import 'clients/chat_session_controller_client.dart';
import 'clients/chat_room_controller_client.dart';
import 'clients/chat_message_controller_client.dart';
import 'clients/chat_friend_apply_controller_client.dart';
import 'clients/chat_friend_controller_client.dart';

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

  ChatSessionControllerClient? _chatSessionController;
  ChatRoomControllerClient? _chatRoomController;
  ChatMessageControllerClient? _chatMessageController;
  ChatFriendApplyControllerClient? _chatFriendApplyController;
  ChatFriendControllerClient? _chatFriendController;

  ChatSessionControllerClient get chatSessionController => _chatSessionController ??= ChatSessionControllerClient(_dio, baseUrl: _baseUrl);

  ChatRoomControllerClient get chatRoomController => _chatRoomController ??= ChatRoomControllerClient(_dio, baseUrl: _baseUrl);

  ChatMessageControllerClient get chatMessageController => _chatMessageController ??= ChatMessageControllerClient(_dio, baseUrl: _baseUrl);

  ChatFriendApplyControllerClient get chatFriendApplyController => _chatFriendApplyController ??= ChatFriendApplyControllerClient(_dio, baseUrl: _baseUrl);

  ChatFriendControllerClient get chatFriendController => _chatFriendController ??= ChatFriendControllerClient(_dio, baseUrl: _baseUrl);
}
