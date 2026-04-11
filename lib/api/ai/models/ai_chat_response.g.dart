// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiChatResponse _$AiChatResponseFromJson(
  Map json,
) => $checkedCreate('AiChatResponse', json, ($checkedConvert) {
  final val = AiChatResponse(
    content: $checkedConvert('content', (v) => v as String?),
    totalTokens: $checkedConvert('totalTokens', (v) => (v as num?)?.toInt()),
    promptTokens: $checkedConvert('promptTokens', (v) => (v as num?)?.toInt()),
    completionTokens: $checkedConvert(
      'completionTokens',
      (v) => (v as num?)?.toInt(),
    ),
  );
  return val;
});

Map<String, dynamic> _$AiChatResponseToJson(AiChatResponse instance) =>
    <String, dynamic>{
      'content': instance.content,
      'totalTokens': instance.totalTokens,
      'promptTokens': instance.promptTokens,
      'completionTokens': instance.completionTokens,
    };
