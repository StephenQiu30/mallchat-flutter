// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_log_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationLogVo _$OperationLogVoFromJson(Map<String, dynamic> json) =>
    OperationLogVo(
      id: (json['id'] as num?)?.toInt(),
      operatorId: (json['operatorId'] as num?)?.toInt(),
      operatorName: json['operatorName'] as String?,
      module: json['module'] as String?,
      action: json['action'] as String?,
      method: json['method'] as String?,
      path: json['path'] as String?,
      requestParams: json['requestParams'] as String?,
      responseStatus: (json['responseStatus'] as num?)?.toInt(),
      success: (json['success'] as num?)?.toInt(),
      errorMessage: json['errorMessage'] as String?,
      clientIp: json['clientIp'] as String?,
      location: json['location'] as String?,
      createTime: json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
    );

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
