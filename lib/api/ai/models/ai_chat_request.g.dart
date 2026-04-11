// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_chat_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiChatRequest _$AiChatRequestFromJson(Map json) =>
    $checkedCreate('AiChatRequest', json, ($checkedConvert) {
      final val = AiChatRequest(
        message: $checkedConvert('message', (v) => v as String?),
        modelType: $checkedConvert('modelType', (v) => v as String?),
        sessionId: $checkedConvert('sessionId', (v) => v as String?),
        systemMessage: $checkedConvert('systemMessage', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$AiChatRequestToJson(AiChatRequest instance) =>
    <String, dynamic>{
      'message': instance.message,
      'modelType': instance.modelType,
      'sessionId': instance.sessionId,
      'systemMessage': instance.systemMessage,
    };
