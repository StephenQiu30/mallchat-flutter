// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_batch_delete_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationBatchDeleteRequest _$NotificationBatchDeleteRequestFromJson(
  Map json,
) => $checkedCreate('NotificationBatchDeleteRequest', json, ($checkedConvert) {
  final val = NotificationBatchDeleteRequest(
    ids: $checkedConvert(
      'ids',
      (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$NotificationBatchDeleteRequestToJson(
  NotificationBatchDeleteRequest instance,
) => <String, dynamic>{'ids': instance.ids};
