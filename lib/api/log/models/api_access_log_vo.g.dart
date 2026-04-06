// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_access_log_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiAccessLogVo _$ApiAccessLogVoFromJson(Map<String, dynamic> json) =>
    ApiAccessLogVo(
      id: (json['id'] as num?)?.toInt(),
      traceId: json['traceId'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      method: json['method'] as String?,
      path: json['path'] as String?,
      query: json['query'] as String?,
      status: (json['status'] as num?)?.toInt(),
      latencyMs: (json['latencyMs'] as num?)?.toInt(),
      clientIp: json['clientIp'] as String?,
      userAgent: json['userAgent'] as String?,
      referer: json['referer'] as String?,
      requestSize: (json['requestSize'] as num?)?.toInt(),
      responseSize: (json['responseSize'] as num?)?.toInt(),
      createTime: json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
    );

Map<String, dynamic> _$ApiAccessLogVoToJson(ApiAccessLogVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'traceId': instance.traceId,
      'userId': instance.userId,
      'method': instance.method,
      'path': instance.path,
      'query': instance.query,
      'status': instance.status,
      'latencyMs': instance.latencyMs,
      'clientIp': instance.clientIp,
      'userAgent': instance.userAgent,
      'referer': instance.referer,
      'requestSize': instance.requestSize,
      'responseSize': instance.responseSize,
      'createTime': instance.createTime?.toIso8601String(),
    };
