// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_ai_chat_record_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageAiChatRecordVo _$BaseResponsePageAiChatRecordVoFromJson(
  Map<String, dynamic> json,
) => BaseResponsePageAiChatRecordVo(
  code: (json['code'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : PageAiChatRecordVo.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponsePageAiChatRecordVoToJson(
  BaseResponsePageAiChatRecordVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
