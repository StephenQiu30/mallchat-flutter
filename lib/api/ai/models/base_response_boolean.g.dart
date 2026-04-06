// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_boolean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseBoolean _$BaseResponseBooleanFromJson(Map<String, dynamic> json) =>
    BaseResponseBoolean(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BaseResponseBooleanToJson(
  BaseResponseBoolean instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
