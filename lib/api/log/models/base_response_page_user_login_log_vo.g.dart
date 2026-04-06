// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_user_login_log_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageUserLoginLogVo _$BaseResponsePageUserLoginLogVoFromJson(
  Map<String, dynamic> json,
) => BaseResponsePageUserLoginLogVo(
  code: (json['code'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : PageUserLoginLogVo.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponsePageUserLoginLogVoToJson(
  BaseResponsePageUserLoginLogVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
