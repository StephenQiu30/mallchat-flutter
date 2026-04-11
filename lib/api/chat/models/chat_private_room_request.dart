// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'chat_private_room_request.g.dart';

/// 获取或创建私聊房间请求
@JsonSerializable()
class ChatPrivateRoomRequest {
  const ChatPrivateRoomRequest({
    required this.peerUserId,
  });
  
  factory ChatPrivateRoomRequest.fromJson(Map<String, Object?> json) => _$ChatPrivateRoomRequestFromJson(json);
  
  /// 对方用户ID
  final int peerUserId;

  Map<String, Object?> toJson() => _$ChatPrivateRoomRequestToJson(this);
}

// Flutter compute serialization functions for ChatPrivateRoomRequest
FutureOr<ChatPrivateRoomRequest> deserializeChatPrivateRoomRequest(Map<String, dynamic> json) =>
    ChatPrivateRoomRequest.fromJson(json);

FutureOr<List<ChatPrivateRoomRequest>> deserializeChatPrivateRoomRequestList(List<Map<String, dynamic>> json) =>
    json.map((e) => ChatPrivateRoomRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeChatPrivateRoomRequest(ChatPrivateRoomRequest? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeChatPrivateRoomRequestList(List<ChatPrivateRoomRequest>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
