// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'chat_friend_user_vo.dart';

part 'base_response_list_chat_friend_user_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseListChatFriendUserVo {
  const BaseResponseListChatFriendUserVo({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponseListChatFriendUserVo.fromJson(Map<String, Object?> json) => _$BaseResponseListChatFriendUserVoFromJson(json);
  
  /// 状态码
  final int? code;

  /// 数据
  final List<ChatFriendUserVo>? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseListChatFriendUserVoToJson(this);
}
