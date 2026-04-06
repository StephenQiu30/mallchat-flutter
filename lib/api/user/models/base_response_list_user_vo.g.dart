// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseListUserVo _$BaseResponseListUserVoFromJson(
  Map<String, dynamic> json,
) => BaseResponseListUserVo(
  code: (json['code'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => UserVo.fromJson(e as Map<String, dynamic>))
      .toList(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponseListUserVoToJson(
  BaseResponseListUserVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
