// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_send_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageSendRequest _$ChatMessageSendRequestFromJson(
  Map<String, dynamic> json,
) => ChatMessageSendRequest(
  roomId: (json['roomId'] as num).toInt(),
  content: json['content'] as String,
  type: (json['type'] as num?)?.toInt(),
);

Map<String, dynamic> _$ChatMessageSendRequestToJson(
  ChatMessageSendRequest instance,
) => <String, dynamic>{
  'roomId': instance.roomId,
  'content': instance.content,
  'type': instance.type,
};
