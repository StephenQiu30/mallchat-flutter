// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_batch_delete_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationBatchDeleteRequest _$NotificationBatchDeleteRequestFromJson(
  Map<String, dynamic> json,
) => NotificationBatchDeleteRequest(
  ids: (json['ids'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
);

Map<String, dynamic> _$NotificationBatchDeleteRequestToJson(
  NotificationBatchDeleteRequest instance,
) => <String, dynamic>{'ids': instance.ids};
