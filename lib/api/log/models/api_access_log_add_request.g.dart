// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_access_log_add_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiAccessLogAddRequest _$ApiAccessLogAddRequestFromJson(
  Map<String, dynamic> json,
) => ApiAccessLogAddRequest(
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
);

Map<String, dynamic> _$ApiAccessLogAddRequestToJson(
  ApiAccessLogAddRequest instance,
) => <String, dynamic>{
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
};
