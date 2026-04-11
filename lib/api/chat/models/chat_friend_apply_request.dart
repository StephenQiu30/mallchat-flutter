// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'chat_friend_apply_request.g.dart';

/// 好友申请请求
@JsonSerializable()
class ChatFriendApplyRequest {
  const ChatFriendApplyRequest({
    required this.targetId,
    required this.msg,
  });
  
  factory ChatFriendApplyRequest.fromJson(Map<String, Object?> json) => _$ChatFriendApplyRequestFromJson(json);
  
  /// 目标用户ID
  final int targetId;

  /// 申请消息
  final String msg;

  Map<String, Object?> toJson() => _$ChatFriendApplyRequestToJson(this);
}

// Flutter compute serialization functions for ChatFriendApplyRequest
FutureOr<ChatFriendApplyRequest> deserializeChatFriendApplyRequest(Map<String, dynamic> json) =>
    ChatFriendApplyRequest.fromJson(json);

FutureOr<List<ChatFriendApplyRequest>> deserializeChatFriendApplyRequestList(List<Map<String, dynamic>> json) =>
    json.map((e) => ChatFriendApplyRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeChatFriendApplyRequest(ChatFriendApplyRequest? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeChatFriendApplyRequestList(List<ChatFriendApplyRequest>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
