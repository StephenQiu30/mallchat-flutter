// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_wx_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseWxLoginResponse _$BaseResponseWxLoginResponseFromJson(
  Map<String, dynamic> json,
) => BaseResponseWxLoginResponse(
  code: (json['code'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : WxLoginResponse.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponseWxLoginResponseToJson(
  BaseResponseWxLoginResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
