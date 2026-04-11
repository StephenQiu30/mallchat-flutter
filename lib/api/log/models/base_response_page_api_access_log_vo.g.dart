// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_api_access_log_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageApiAccessLogVo _$BaseResponsePageApiAccessLogVoFromJson(
  Map json,
) => $checkedCreate('BaseResponsePageApiAccessLogVo', json, ($checkedConvert) {
  final val = BaseResponsePageApiAccessLogVo(
    code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => v == null
          ? null
          : PageApiAccessLogVo.fromJson(Map<String, Object?>.from(v as Map)),
    ),
    message: $checkedConvert('message', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$BaseResponsePageApiAccessLogVoToJson(
  BaseResponsePageApiAccessLogVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.toJson(),
  'message': instance.message,
};
