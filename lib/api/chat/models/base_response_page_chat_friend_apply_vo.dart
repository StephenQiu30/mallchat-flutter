// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'page_chat_friend_apply_vo.dart';

part 'base_response_page_chat_friend_apply_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponsePageChatFriendApplyVo {
  const BaseResponsePageChatFriendApplyVo({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponsePageChatFriendApplyVo.fromJson(Map<String, Object?> json) => _$BaseResponsePageChatFriendApplyVoFromJson(json);
  
  /// 状态码
  final int? code;
  final PageChatFriendApplyVo? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponsePageChatFriendApplyVoToJson(this);
}
