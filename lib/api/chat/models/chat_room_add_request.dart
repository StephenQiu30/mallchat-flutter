// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'chat_room_add_request.g.dart';

/// 创建聊天室请求
@JsonSerializable()
class ChatRoomAddRequest {
  const ChatRoomAddRequest({
    required this.name,
    required this.type,
    this.avatar,
  });
  
  factory ChatRoomAddRequest.fromJson(Map<String, Object?> json) => _$ChatRoomAddRequestFromJson(json);
  
  /// 房间名称
  final String name;

  /// 房间类型：1-群聊，2-私聊
  final int type;

  /// 房间头像
  final String? avatar;

  Map<String, Object?> toJson() => _$ChatRoomAddRequestToJson(this);
}
