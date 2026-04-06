// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'chat_message_vo.g.dart';

/// 聊天消息视图对象
@JsonSerializable()
class ChatMessageVo {
  const ChatMessageVo({
    this.id,
    this.roomId,
    this.fromUserId,
    this.fromUserName,
    this.fromUserAvatar,
    this.content,
    this.type,
    this.createTime,
  });
  
  factory ChatMessageVo.fromJson(Map<String, Object?> json) => _$ChatMessageVoFromJson(json);
  
  /// 消息ID
  final int? id;

  /// 房间ID
  final int? roomId;

  /// 发送者ID
  final int? fromUserId;

  /// 发送者姓名
  final String? fromUserName;

  /// 发送者头像
  final String? fromUserAvatar;

  /// 消息内容
  final String? content;

  /// 消息类型：1-文本，2-图片，3-文件
  final int? type;

  /// 发送时间
  final DateTime? createTime;

  Map<String, Object?> toJson() => _$ChatMessageVoToJson(this);
}
