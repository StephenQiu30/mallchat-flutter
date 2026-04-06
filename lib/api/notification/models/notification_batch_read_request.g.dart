// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_batch_read_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationBatchReadRequest _$NotificationBatchReadRequestFromJson(
  Map<String, dynamic> json,
) => NotificationBatchReadRequest(
  ids: (json['ids'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
);

Map<String, dynamic> _$NotificationBatchReadRequestToJson(
  NotificationBatchReadRequest instance,
) => <String, dynamic>{'ids': instance.ids};
