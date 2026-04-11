// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_log_query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationLogQueryRequest _$OperationLogQueryRequestFromJson(Map json) =>
    $checkedCreate('OperationLogQueryRequest', json, ($checkedConvert) {
      final val = OperationLogQueryRequest(
        current: $checkedConvert('current', (v) => (v as num?)?.toInt()),
        pageSize: $checkedConvert('pageSize', (v) => (v as num?)?.toInt()),
        sortField: $checkedConvert('sortField', (v) => v as String?),
        sortOrder: $checkedConvert('sortOrder', (v) => v as String?),
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        operatorId: $checkedConvert('operatorId', (v) => (v as num?)?.toInt()),
        operatorName: $checkedConvert('operatorName', (v) => v as String?),
        module: $checkedConvert('module', (v) => v as String?),
        action: $checkedConvert('action', (v) => v as String?),
        success: $checkedConvert('success', (v) => (v as num?)?.toInt()),
        clientIp: $checkedConvert('clientIp', (v) => v as String?),
        searchText: $checkedConvert('searchText', (v) => v as String?),
      );
      return val;
    });

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
