// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiChatResponse _$AiChatResponseFromJson(Map<String, dynamic> json) =>
    AiChatResponse(
      content: json['content'] as String?,
      totalTokens: (json['totalTokens'] as num?)?.toInt(),
      promptTokens: (json['promptTokens'] as num?)?.toInt(),
      completionTokens: (json['completionTokens'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AiChatResponseToJson(AiChatResponse instance) =>
    <String, dynamic>{
      'content': instance.content,
      'totalTokens': instance.totalTokens,
      'promptTokens': instance.promptTokens,
      'completionTokens': instance.completionTokens,
    };
