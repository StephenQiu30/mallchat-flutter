// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageUserVo _$BaseResponsePageUserVoFromJson(
  Map<String, dynamic> json,
) => BaseResponsePageUserVo(
  code: (json['code'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : PageUserVo.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponsePageUserVoToJson(
  BaseResponsePageUserVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
