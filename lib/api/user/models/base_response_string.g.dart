// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_string.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseString _$BaseResponseStringFromJson(Map<String, dynamic> json) =>
    BaseResponseString(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BaseResponseStringToJson(BaseResponseString instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };
