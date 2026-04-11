// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_log_add_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationLogAddRequest _$OperationLogAddRequestFromJson(Map json) =>
    $checkedCreate('OperationLogAddRequest', json, ($checkedConvert) {
      final val = OperationLogAddRequest(
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
        userAgent: $checkedConvert('userAgent', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$OperationLogAddRequestToJson(
  OperationLogAddRequest instance,
) => <String, dynamic>{
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
  'userAgent': instance.userAgent,
};
