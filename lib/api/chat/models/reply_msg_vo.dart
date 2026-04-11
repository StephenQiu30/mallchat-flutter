// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'reply_msg_vo.g.dart';

/// 被回复的消息简要信息
@JsonSerializable()
class ReplyMsgVo {
  const ReplyMsgVo({
    this.id,
    this.userName,
    this.content,
    this.type,
  });
  
  factory ReplyMsgVo.fromJson(Map<String, Object?> json) => _$ReplyMsgVoFromJson(json);
  
  /// 消息ID
  final int? id;

  /// 发送者姓名
  final String? userName;

  /// 消息内容
  final String? content;

  /// 消息类型
  final int? type;

  Map<String, Object?> toJson() => _$ReplyMsgVoToJson(this);
}

// Flutter compute serialization functions for ReplyMsgVo
FutureOr<ReplyMsgVo> deserializeReplyMsgVo(Map<String, dynamic> json) =>
    ReplyMsgVo.fromJson(json);

FutureOr<List<ReplyMsgVo>> deserializeReplyMsgVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => ReplyMsgVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeReplyMsgVo(ReplyMsgVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeReplyMsgVoList(List<ReplyMsgVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
