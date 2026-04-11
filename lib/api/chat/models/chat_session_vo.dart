// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'chat_session_vo.g.dart';

/// 聊天会话VO
@JsonSerializable()
class ChatSessionVo {
  const ChatSessionVo({
    this.roomId,
    this.name,
    this.avatar,
    this.type,
    this.lastMessage,
    this.unreadCount,
    this.topStatus,
    this.activeTime,
  });
  
  factory ChatSessionVo.fromJson(Map<String, Object?> json) => _$ChatSessionVoFromJson(json);
  
  /// 房间ID
  final int? roomId;

  /// 房间名称
  final String? name;

  /// 房间头像
  final String? avatar;

  /// 房间类型：1-群聊，2-私聊
  final int? type;

  /// 最后一条消息内容
  final String? lastMessage;

  /// 未读数
  final int? unreadCount;

  /// 置顶状态：0-否，1-是
  final int? topStatus;

  /// 最后活跃时间
  final DateTime? activeTime;

  Map<String, Object?> toJson() => _$ChatSessionVoToJson(this);
}

// Flutter compute serialization functions for ChatSessionVo
FutureOr<ChatSessionVo> deserializeChatSessionVo(Map<String, dynamic> json) =>
    ChatSessionVo.fromJson(json);

FutureOr<List<ChatSessionVo>> deserializeChatSessionVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => ChatSessionVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeChatSessionVo(ChatSessionVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeChatSessionVoList(List<ChatSessionVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
