// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_access_log_add_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiAccessLogAddRequest _$ApiAccessLogAddRequestFromJson(
  Map json,
) => $checkedCreate('ApiAccessLogAddRequest', json, ($checkedConvert) {
  final val = ApiAccessLogAddRequest(
    traceId: $checkedConvert('traceId', (v) => v as String?),
    userId: $checkedConvert('userId', (v) => (v as num?)?.toInt()),
    method: $checkedConvert('method', (v) => v as String?),
    path: $checkedConvert('path', (v) => v as String?),
    query: $checkedConvert('query', (v) => v as String?),
    status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
    latencyMs: $checkedConvert('latencyMs', (v) => (v as num?)?.toInt()),
    clientIp: $checkedConvert('clientIp', (v) => v as String?),
    userAgent: $checkedConvert('userAgent', (v) => v as String?),
    referer: $checkedConvert('referer', (v) => v as String?),
    requestSize: $checkedConvert('requestSize', (v) => (v as num?)?.toInt()),
    responseSize: $checkedConvert('responseSize', (v) => (v as num?)?.toInt()),
  );
  return val;
});

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
