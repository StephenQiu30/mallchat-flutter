// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'chat_friend_apply_vo.g.dart';

/// 好友申请记录VO
@JsonSerializable()
class ChatFriendApplyVo {
  const ChatFriendApplyVo({
    this.id,
    this.userId,
    this.userName,
    this.userAvatar,
    this.msg,
    this.status,
    this.createTime,
  });
  
  factory ChatFriendApplyVo.fromJson(Map<String, Object?> json) => _$ChatFriendApplyVoFromJson(json);
  
  /// 申请ID
  final int? id;

  /// 发起用户ID
  final int? userId;

  /// 发起用户昵称
  final String? userName;

  /// 发起用户头像
  final String? userAvatar;

  /// 申请消息
  final String? msg;

  /// 状态：1-待处理，2-已同意，3-已忽略
  final int? status;

  /// 申请时间
  final DateTime? createTime;

  Map<String, Object?> toJson() => _$ChatFriendApplyVoToJson(this);
}

// Flutter compute serialization functions for ChatFriendApplyVo
FutureOr<ChatFriendApplyVo> deserializeChatFriendApplyVo(Map<String, dynamic> json) =>
    ChatFriendApplyVo.fromJson(json);

FutureOr<List<ChatFriendApplyVo>> deserializeChatFriendApplyVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => ChatFriendApplyVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeChatFriendApplyVo(ChatFriendApplyVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeChatFriendApplyVoList(List<ChatFriendApplyVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
