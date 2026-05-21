// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_chat_record_delete_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiChatRecordDeleteRequest _$AiChatRecordDeleteRequestFromJson(Map json) =>
    $checkedCreate('AiChatRecordDeleteRequest', json, ($checkedConvert) {
      final val = AiChatRecordDeleteRequest(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$AiChatRecordDeleteRequestToJson(
  AiChatRecordDeleteRequest instance,
) => <String, dynamic>{'id': instance.id};
