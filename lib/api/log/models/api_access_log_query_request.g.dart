// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_access_log_query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiAccessLogQueryRequest _$ApiAccessLogQueryRequestFromJson(
  Map<String, dynamic> json,
) => ApiAccessLogQueryRequest(
  current: (json['current'] as num?)?.toInt(),
  pageSize: (json['pageSize'] as num?)?.toInt(),
  sortField: json['sortField'] as String?,
  sortOrder: json['sortOrder'] as String?,
  id: (json['id'] as num?)?.toInt(),
  traceId: json['traceId'] as String?,
  userId: (json['userId'] as num?)?.toInt(),
  method: json['method'] as String?,
  path: json['path'] as String?,
  status: (json['status'] as num?)?.toInt(),
  clientIp: json['clientIp'] as String?,
  searchText: json['searchText'] as String?,
);

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
