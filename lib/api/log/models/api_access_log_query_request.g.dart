// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_access_log_query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiAccessLogQueryRequest _$ApiAccessLogQueryRequestFromJson(Map json) =>
    $checkedCreate('ApiAccessLogQueryRequest', json, ($checkedConvert) {
      final val = ApiAccessLogQueryRequest(
        current: $checkedConvert('current', (v) => (v as num?)?.toInt()),
        pageSize: $checkedConvert('pageSize', (v) => (v as num?)?.toInt()),
        sortField: $checkedConvert('sortField', (v) => v as String?),
        sortOrder: $checkedConvert('sortOrder', (v) => v as String?),
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        traceId: $checkedConvert('traceId', (v) => v as String?),
        userId: $checkedConvert('userId', (v) => (v as num?)?.toInt()),
        method: $checkedConvert('method', (v) => v as String?),
        path: $checkedConvert('path', (v) => v as String?),
        status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
        clientIp: $checkedConvert('clientIp', (v) => v as String?),
        searchText: $checkedConvert('searchText', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ApiAccessLogQueryRequestToJson(
  ApiAccessLogQueryRequest instance,
) => <String, dynamic>{
  'current': instance.current,
  'pageSize': instance.pageSize,
  'sortField': instance.sortField,
  'sortOrder': instance.sortOrder,
  'id': instance.id,
  'traceId': instance.traceId,
  'userId': instance.userId,
  'method': instance.method,
  'path': instance.path,
  'status': instance.status,
  'clientIp': instance.clientIp,
  'searchText': instance.searchText,
};
