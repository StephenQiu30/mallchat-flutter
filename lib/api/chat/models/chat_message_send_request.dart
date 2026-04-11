// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'chat_message_send_request.g.dart';

/// 发送消息请求
@JsonSerializable()
class ChatMessageSendRequest {
  const ChatMessageSendRequest({
    required this.roomId,
    required this.content,
    required this.type,
    this.extra,
    this.replyMsgId,
  });
  
  factory ChatMessageSendRequest.fromJson(Map<String, Object?> json) => _$ChatMessageSendRequestFromJson(json);
  
  /// 房间ID
  final int roomId;

  /// 消息内容
  final String content;

  /// 消息类型：1-文本，2-图片，3-文件
  final int type;

  /// 消息扩展内容（JSON 字符串）
  final String? extra;

  /// 被回复的消息ID
  final int? replyMsgId;

  Map<String, Object?> toJson() => _$ChatMessageSendRequestToJson(this);
}

// Flutter compute serialization functions for ChatMessageSendRequest
FutureOr<ChatMessageSendRequest> deserializeChatMessageSendRequest(Map<String, dynamic> json) =>
    ChatMessageSendRequest.fromJson(json);

FutureOr<List<ChatMessageSendRequest>> deserializeChatMessageSendRequestList(List<Map<String, dynamic>> json) =>
    json.map((e) => ChatMessageSendRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeChatMessageSendRequest(ChatMessageSendRequest? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeChatMessageSendRequestList(List<ChatMessageSendRequest>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
