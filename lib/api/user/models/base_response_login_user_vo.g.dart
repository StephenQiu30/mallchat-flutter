// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_login_user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseLoginUserVo _$BaseResponseLoginUserVoFromJson(
  Map<String, dynamic> json,
) => BaseResponseLoginUserVo(
  code: (json['code'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : LoginUserVo.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponseLoginUserVoToJson(
  BaseResponseLoginUserVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
