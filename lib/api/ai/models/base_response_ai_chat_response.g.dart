// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_ai_chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseAiChatResponse _$BaseResponseAiChatResponseFromJson(Map json) =>
    $checkedCreate('BaseResponseAiChatResponse', json, ($checkedConvert) {
      final val = BaseResponseAiChatResponse(
        code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => v == null
              ? null
              : AiChatResponse.fromJson(Map<String, Object?>.from(v as Map)),
        ),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BaseResponseAiChatResponseToJson(
  BaseResponseAiChatResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.toJson(),
  'message': instance.message,
};
