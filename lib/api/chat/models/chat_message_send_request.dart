// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'chat_message_send_request.g.dart';

/// 发送消息请求
@JsonSerializable()
class ChatMessageSendRequest {
  const ChatMessageSendRequest({
    required this.roomId,
    required this.content,
    this.type,
  });
  
  factory ChatMessageSendRequest.fromJson(Map<String, Object?> json) => _$ChatMessageSendRequestFromJson(json);
  
  /// 房间ID
  final int roomId;

  /// 消息内容
  final String content;

  /// 消息类型：1-文本，2-图片，3-文件
  final int? type;

  Map<String, Object?> toJson() => _$ChatMessageSendRequestToJson(this);
}
