// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageUser _$BaseResponsePageUserFromJson(
  Map<String, dynamic> json,
) => BaseResponsePageUser(
  code: (json['code'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : PageUser.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponsePageUserToJson(
  BaseResponsePageUser instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
