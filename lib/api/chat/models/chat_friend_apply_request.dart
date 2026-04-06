// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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
