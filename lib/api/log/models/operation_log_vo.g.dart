// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_log_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationLogVo _$OperationLogVoFromJson(Map json) =>
    $checkedCreate('OperationLogVo', json, ($checkedConvert) {
      final val = OperationLogVo(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        operatorId: $checkedConvert('operatorId', (v) => (v as num?)?.toInt()),
        operatorName: $checkedConvert('operatorName', (v) => v as String?),
        module: $checkedConvert('module', (v) => v as String?),
        action: $checkedConvert('action', (v) => v as String?),
        method: $checkedConvert('method', (v) => v as String?),
        path: $checkedConvert('path', (v) => v as String?),
        requestParams: $checkedConvert('requestParams', (v) => v as String?),
        responseStatus: $checkedConvert(
          'responseStatus',
          (v) => (v as num?)?.toInt(),
        ),
        success: $checkedConvert('success', (v) => (v as num?)?.toInt()),
        errorMessage: $checkedConvert('errorMessage', (v) => v as String?),
        clientIp: $checkedConvert('clientIp', (v) => v as String?),
        location: $checkedConvert('location', (v) => v as String?),
        createTime: $checkedConvert(
          'createTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$OperationLogVoToJson(OperationLogVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'operatorId': instance.operatorId,
      'operatorName': instance.operatorName,
      'module': instance.module,
      'action': instance.action,
      'method': instance.method,
      'path': instance.path,
      'requestParams': instance.requestParams,
      'responseStatus': instance.responseStatus,
      'success': instance.success,
      'errorMessage': instance.errorMessage,
      'clientIp': instance.clientIp,
      'location': instance.location,
      'createTime': instance.createTime?.toIso8601String(),
    };
