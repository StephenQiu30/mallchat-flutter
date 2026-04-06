// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_api_access_log_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageApiAccessLogVo _$BaseResponsePageApiAccessLogVoFromJson(
  Map<String, dynamic> json,
) => BaseResponsePageApiAccessLogVo(
  code: (json['code'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : PageApiAccessLogVo.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponsePageApiAccessLogVoToJson(
  BaseResponsePageApiAccessLogVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
