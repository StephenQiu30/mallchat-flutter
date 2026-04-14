// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'chat_message_read_request.g.dart';

/// 消息已读上报请求
@JsonSerializable()
class ChatMessageReadRequest {
  const ChatMessageReadRequest({
    required this.roomId,
    required this.lastReadMessageId,
  });

  factory ChatMessageReadRequest.fromJson(Map<String, Object?> json) =>
      _$ChatMessageReadRequestFromJson(json);

  /// 房间ID
  final int roomId;

  /// 已读到的最后一条消息ID
  final int lastReadMessageId;

  Map<String, Object?> toJson() => _$ChatMessageReadRequestToJson(this);
}

// Flutter compute serialization functions for ChatMessageReadRequest
FutureOr<ChatMessageReadRequest> deserializeChatMessageReadRequest(
  Map<String, dynamic> json,
) => ChatMessageReadRequest.fromJson(json);

FutureOr<List<ChatMessageReadRequest>> deserializeChatMessageReadRequestList(
  List<Map<String, dynamic>> json,
) => json.map((e) => ChatMessageReadRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeChatMessageReadRequest(
  ChatMessageReadRequest? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeChatMessageReadRequestList(
  List<ChatMessageReadRequest>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
