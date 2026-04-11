// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_notification_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageNotificationVo _$BaseResponsePageNotificationVoFromJson(
  Map json,
) => $checkedCreate('BaseResponsePageNotificationVo', json, ($checkedConvert) {
  final val = BaseResponsePageNotificationVo(
    code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => v == null
          ? null
          : PageNotificationVo.fromJson(Map<String, Object?>.from(v as Map)),
    ),
    message: $checkedConvert('message', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$BaseResponsePageNotificationVoToJson(
  BaseResponsePageNotificationVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.toJson(),
  'message': instance.message,
};
