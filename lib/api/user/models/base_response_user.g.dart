// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseUser _$BaseResponseUserFromJson(Map<String, dynamic> json) =>
    BaseResponseUser(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : User.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BaseResponseUserToJson(BaseResponseUser instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };
