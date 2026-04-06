// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationQueryRequest _$NotificationQueryRequestFromJson(
  Map<String, dynamic> json,
) => NotificationQueryRequest(
  current: (json['current'] as num?)?.toInt(),
  pageSize: (json['pageSize'] as num?)?.toInt(),
  sortField: json['sortField'] as String?,
  sortOrder: json['sortOrder'] as String?,
  id: (json['id'] as num?)?.toInt(),
  type: json['type'] as String?,
  userId: (json['userId'] as num?)?.toInt(),
  isRead: (json['isRead'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
  relatedType: json['relatedType'] as String?,
  searchText: json['searchText'] as String?,
);

Map<String, dynamic> _$NotificationQueryRequestToJson(
  NotificationQueryRequest instance,
) => <String, dynamic>{
  'current': instance.current,
  'pageSize': instance.pageSize,
  'sortField': instance.sortField,
  'sortOrder': instance.sortOrder,
  'id': instance.id,
  'type': instance.type,
  'userId': instance.userId,
  'isRead': instance.isRead,
  'status': instance.status,
  'relatedType': instance.relatedType,
  'searchText': instance.searchText,
};
