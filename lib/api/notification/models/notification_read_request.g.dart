// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_read_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationReadRequest _$NotificationReadRequestFromJson(Map json) =>
    $checkedCreate('NotificationReadRequest', json, ($checkedConvert) {
      final val = NotificationReadRequest(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$NotificationReadRequestToJson(
  NotificationReadRequest instance,
) => <String, dynamic>{'id': instance.id};
