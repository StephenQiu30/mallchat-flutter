// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_log_query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationLogQueryRequest _$OperationLogQueryRequestFromJson(
  Map<String, dynamic> json,
) => OperationLogQueryRequest(
  current: (json['current'] as num?)?.toInt(),
  pageSize: (json['pageSize'] as num?)?.toInt(),
  sortField: json['sortField'] as String?,
  sortOrder: json['sortOrder'] as String?,
  id: (json['id'] as num?)?.toInt(),
  operatorId: (json['operatorId'] as num?)?.toInt(),
  operatorName: json['operatorName'] as String?,
  module: json['module'] as String?,
  action: json['action'] as String?,
  success: (json['success'] as num?)?.toInt(),
  clientIp: json['clientIp'] as String?,
  searchText: json['searchText'] as String?,
);

Map<String, dynamic> _$OperationLogQueryRequestToJson(
  OperationLogQueryRequest instance,
) => <String, dynamic>{
  'current': instance.current,
  'pageSize': instance.pageSize,
  'sortField': instance.sortField,
  'sortOrder': instance.sortOrder,
  'id': instance.id,
  'operatorId': instance.operatorId,
  'operatorName': instance.operatorName,
  'module': instance.module,
  'action': instance.action,
  'success': instance.success,
  'clientIp': instance.clientIp,
  'searchText': instance.searchText,
};
