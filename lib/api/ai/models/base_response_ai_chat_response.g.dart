// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_ai_chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseAiChatResponse _$BaseResponseAiChatResponseFromJson(
  Map<String, dynamic> json,
) => BaseResponseAiChatResponse(
  code: (json['code'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : AiChatResponse.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponseAiChatResponseToJson(
  BaseResponseAiChatResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
