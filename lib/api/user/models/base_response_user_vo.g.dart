// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseUserVo _$BaseResponseUserVoFromJson(Map<String, dynamic> json) =>
    BaseResponseUserVo(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : UserVo.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BaseResponseUserVoToJson(BaseResponseUserVo instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };
