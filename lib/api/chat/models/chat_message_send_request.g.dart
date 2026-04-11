// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_send_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageSendRequest _$ChatMessageSendRequestFromJson(Map json) =>
    $checkedCreate('ChatMessageSendRequest', json, ($checkedConvert) {
      final val = ChatMessageSendRequest(
        roomId: $checkedConvert('roomId', (v) => (v as num).toInt()),
        content: $checkedConvert('content', (v) => v as String),
        type: $checkedConvert('type', (v) => (v as num).toInt()),
        extra: $checkedConvert('extra', (v) => v as String?),
        replyMsgId: $checkedConvert('replyMsgId', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$ChatMessageSendRequestToJson(
  ChatMessageSendRequest instance,
) => <String, dynamic>{
  'roomId': instance.roomId,
  'content': instance.content,
  'type': instance.type,
  'extra': instance.extra,
  'replyMsgId': instance.replyMsgId,
};
