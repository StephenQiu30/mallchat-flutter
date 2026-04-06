// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_file_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseFileVo _$BaseResponseFileVoFromJson(Map<String, dynamic> json) =>
    BaseResponseFileVo(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : FileVo.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BaseResponseFileVoToJson(BaseResponseFileVo instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };
