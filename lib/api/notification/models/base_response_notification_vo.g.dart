// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_notification_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseNotificationVo _$BaseResponseNotificationVoFromJson(Map json) =>
    $checkedCreate('BaseResponseNotificationVo', json, ($checkedConvert) {
      final val = BaseResponseNotificationVo(
        code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => v == null
              ? null
              : NotificationVo.fromJson(Map<String, Object?>.from(v as Map)),
        ),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BaseResponseNotificationVoToJson(
  BaseResponseNotificationVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.toJson(),
  'message': instance.message,
};
