// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'chat_message_read_request.g.dart';

/// 消息已读上报请求
@JsonSerializable()
class ChatMessageReadRequest {
  const ChatMessageReadRequest({
    required this.roomId,
    required this.lastReadMessageId,
  });
  
  factory ChatMessageReadRequest.fromJson(Map<String, Object?> json) => _$ChatMessageReadRequestFromJson(json);
  
  /// 房间ID
  final int roomId;

  /// 已读到的最后一条消息ID
  final int lastReadMessageId;

  Map<String, Object?> toJson() => _$ChatMessageReadRequestToJson(this);
}
