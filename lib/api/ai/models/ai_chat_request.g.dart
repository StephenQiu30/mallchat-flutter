// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_chat_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiChatRequest _$AiChatRequestFromJson(Map<String, dynamic> json) =>
    AiChatRequest(
      message: json['message'] as String?,
      modelType: json['modelType'] as String?,
      sessionId: json['sessionId'] as String?,
      systemMessage: json['systemMessage'] as String?,
    );

Map<String, dynamic> _$AiChatRequestToJson(AiChatRequest instance) =>
    <String, dynamic>{
      'message': instance.message,
      'modelType': instance.modelType,
      'sessionId': instance.sessionId,
      'systemMessage': instance.systemMessage,
    };
