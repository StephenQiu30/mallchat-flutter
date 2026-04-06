// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_integer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseInteger _$BaseResponseIntegerFromJson(Map<String, dynamic> json) =>
    BaseResponseInteger(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BaseResponseIntegerToJson(
  BaseResponseInteger instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
