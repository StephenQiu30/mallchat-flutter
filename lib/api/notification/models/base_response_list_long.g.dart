// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_long.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseListLong _$BaseResponseListLongFromJson(
  Map<String, dynamic> json,
) => BaseResponseListLong(
  code: (json['code'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponseListLongToJson(
  BaseResponseListLong instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
