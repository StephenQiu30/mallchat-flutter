// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_notification_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseNotificationVo _$BaseResponseNotificationVoFromJson(
  Map<String, dynamic> json,
) => BaseResponseNotificationVo(
  code: (json['code'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : NotificationVo.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponseNotificationVoToJson(
  BaseResponseNotificationVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
