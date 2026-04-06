// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_read_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageReadRequest _$ChatMessageReadRequestFromJson(
  Map<String, dynamic> json,
) => ChatMessageReadRequest(
  roomId: (json['roomId'] as num).toInt(),
  lastReadMessageId: (json['lastReadMessageId'] as num).toInt(),
);

Map<String, dynamic> _$ChatMessageReadRequestToJson(
  ChatMessageReadRequest instance,
) => <String, dynamic>{
  'roomId': instance.roomId,
  'lastReadMessageId': instance.lastReadMessageId,
};
