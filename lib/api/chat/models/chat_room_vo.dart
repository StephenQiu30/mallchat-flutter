// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'chat_room_vo.g.dart';

/// 聊天室视图对象
@JsonSerializable()
class ChatRoomVo {
  const ChatRoomVo({
    this.id,
    this.name,
    this.type,
    this.avatar,
    this.createTime,
  });
  
  factory ChatRoomVo.fromJson(Map<String, Object?> json) => _$ChatRoomVoFromJson(json);
  
  /// 房间ID
  final int? id;

  /// 房间名称
  final String? name;

  /// 房间类型：1-群聊，2-私聊
  final int? type;

  /// 房间头像
  final String? avatar;

  /// 创建时间
  final DateTime? createTime;

  Map<String, Object?> toJson() => _$ChatRoomVoToJson(this);
}
