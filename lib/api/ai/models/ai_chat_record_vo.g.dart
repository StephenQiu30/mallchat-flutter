// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_chat_record_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiChatRecordVo _$AiChatRecordVoFromJson(Map<String, dynamic> json) =>
    AiChatRecordVo(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      sessionId: json['sessionId'] as String?,
      message: json['message'] as String?,
      response: json['response'] as String?,
      modelType: json['modelType'] as String?,
      createTime: json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
      updateTime: json['updateTime'] == null
          ? null
          : DateTime.parse(json['updateTime'] as String),
    );

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
