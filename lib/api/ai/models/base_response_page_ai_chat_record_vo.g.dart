// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_ai_chat_record_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageAiChatRecordVo _$BaseResponsePageAiChatRecordVoFromJson(
  Map json,
) => $checkedCreate('BaseResponsePageAiChatRecordVo', json, ($checkedConvert) {
  final val = BaseResponsePageAiChatRecordVo(
    code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => v == null
          ? null
          : PageAiChatRecordVo.fromJson(Map<String, Object?>.from(v as Map)),
    ),
    message: $checkedConvert('message', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$BaseResponsePageAiChatRecordVoToJson(
  BaseResponsePageAiChatRecordVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.toJson(),
  'message': instance.message,
};
