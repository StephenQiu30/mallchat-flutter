// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_notification_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageNotificationVo _$BaseResponsePageNotificationVoFromJson(
  Map<String, dynamic> json,
) => BaseResponsePageNotificationVo(
  code: (json['code'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : PageNotificationVo.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponsePageNotificationVoToJson(
  BaseResponsePageNotificationVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
