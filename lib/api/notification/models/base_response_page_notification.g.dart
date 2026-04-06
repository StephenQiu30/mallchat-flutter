// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageNotification _$BaseResponsePageNotificationFromJson(
  Map<String, dynamic> json,
) => BaseResponsePageNotification(
  code: (json['code'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : PageNotification.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponsePageNotificationToJson(
  BaseResponsePageNotification instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
