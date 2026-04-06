// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'chat_friend_add_request.g.dart';

/// 添加好友请求
@JsonSerializable()
class ChatFriendAddRequest {
  const ChatFriendAddRequest({
    required this.friendUserId,
  });
  
  factory ChatFriendAddRequest.fromJson(Map<String, Object?> json) => _$ChatFriendAddRequestFromJson(json);
  
  /// 好友用户ID
  final int friendUserId;

  Map<String, Object?> toJson() => _$ChatFriendAddRequestToJson(this);
}
