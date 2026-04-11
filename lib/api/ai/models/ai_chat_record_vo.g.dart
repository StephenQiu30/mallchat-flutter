// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_chat_record_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiChatRecordVo _$AiChatRecordVoFromJson(Map json) =>
    $checkedCreate('AiChatRecordVo', json, ($checkedConvert) {
      final val = AiChatRecordVo(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        userId: $checkedConvert('userId', (v) => (v as num?)?.toInt()),
        sessionId: $checkedConvert('sessionId', (v) => v as String?),
        message: $checkedConvert('message', (v) => v as String?),
        response: $checkedConvert('response', (v) => v as String?),
        modelType: $checkedConvert('modelType', (v) => v as String?),
        createTime: $checkedConvert(
          'createTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        updateTime: $checkedConvert(
          'updateTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AiChatRecordVoToJson(AiChatRecordVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'sessionId': instance.sessionId,
      'message': instance.message,
      'response': instance.response,
      'modelType': instance.modelType,
      'createTime': instance.createTime?.toIso8601String(),
      'updateTime': instance.updateTime?.toIso8601String(),
    };
