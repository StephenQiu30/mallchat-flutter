// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_long.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseLong _$BaseResponseLongFromJson(Map<String, dynamic> json) =>
    BaseResponseLong(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BaseResponseLongToJson(BaseResponseLong instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };
