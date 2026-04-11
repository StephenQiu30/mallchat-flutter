// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_batch_read_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationBatchReadRequest _$NotificationBatchReadRequestFromJson(Map json) =>
    $checkedCreate('NotificationBatchReadRequest', json, ($checkedConvert) {
      final val = NotificationBatchReadRequest(
        ids: $checkedConvert(
          'ids',
          (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$NotificationBatchReadRequestToJson(
  NotificationBatchReadRequest instance,
) => <String, dynamic>{'ids': instance.ids};
