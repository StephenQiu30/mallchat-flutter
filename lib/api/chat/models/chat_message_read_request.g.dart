// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_read_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageReadRequest _$ChatMessageReadRequestFromJson(Map json) =>
    $checkedCreate('ChatMessageReadRequest', json, ($checkedConvert) {
      final val = ChatMessageReadRequest(
        roomId: $checkedConvert('roomId', (v) => (v as num).toInt()),
        lastReadMessageId: $checkedConvert(
          'lastReadMessageId',
          (v) => (v as num).toInt(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ChatMessageReadRequestToJson(
  ChatMessageReadRequest instance,
) => <String, dynamic>{
  'roomId': instance.roomId,
  'lastReadMessageId': instance.lastReadMessageId,
};
