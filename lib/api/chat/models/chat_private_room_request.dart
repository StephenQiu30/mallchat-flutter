// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'chat_private_room_request.g.dart';

/// 获取或创建私聊房间请求
@JsonSerializable()
class ChatPrivateRoomRequest {
  const ChatPrivateRoomRequest({
    required this.peerUserId,
  });
  
  factory ChatPrivateRoomRequest.fromJson(Map<String, Object?> json) => _$ChatPrivateRoomRequestFromJson(json);
  
  /// 对方用户ID
  final int peerUserId;

  Map<String, Object?> toJson() => _$ChatPrivateRoomRequestToJson(this);
}
