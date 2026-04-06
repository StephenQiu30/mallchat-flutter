// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'chat_friend_approve_request.g.dart';

/// 好友审核请求
@JsonSerializable()
class ChatFriendApproveRequest {
  const ChatFriendApproveRequest({
    required this.applyId,
    required this.status,
  });
  
  factory ChatFriendApproveRequest.fromJson(Map<String, Object?> json) => _$ChatFriendApproveRequestFromJson(json);
  
  /// 申请记录ID
  final int applyId;

  /// 审核状态：2-同意，3-拒绝
  final int status;

  Map<String, Object?> toJson() => _$ChatFriendApproveRequestToJson(this);
}
