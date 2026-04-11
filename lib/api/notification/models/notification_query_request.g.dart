// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationQueryRequest _$NotificationQueryRequestFromJson(Map json) =>
    $checkedCreate('NotificationQueryRequest', json, ($checkedConvert) {
      final val = NotificationQueryRequest(
        current: $checkedConvert('current', (v) => (v as num?)?.toInt()),
        pageSize: $checkedConvert('pageSize', (v) => (v as num?)?.toInt()),
        sortField: $checkedConvert('sortField', (v) => v as String?),
        sortOrder: $checkedConvert('sortOrder', (v) => v as String?),
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        type: $checkedConvert('type', (v) => v as String?),
        userId: $checkedConvert('userId', (v) => (v as num?)?.toInt()),
        isRead: $checkedConvert('isRead', (v) => (v as num?)?.toInt()),
        status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
        relatedType: $checkedConvert('relatedType', (v) => v as String?),
        searchText: $checkedConvert('searchText', (v) => v as String?),
      );
      return val;
    });

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
