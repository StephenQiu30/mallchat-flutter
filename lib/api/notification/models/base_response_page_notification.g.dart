// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageNotification _$BaseResponsePageNotificationFromJson(Map json) =>
    $checkedCreate('BaseResponsePageNotification', json, ($checkedConvert) {
      final val = BaseResponsePageNotification(
        code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => v == null
              ? null
              : PageNotification.fromJson(Map<String, Object?>.from(v as Map)),
        ),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BaseResponsePageNotificationToJson(
  BaseResponsePageNotification instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.toJson(),
  'message': instance.message,
};
