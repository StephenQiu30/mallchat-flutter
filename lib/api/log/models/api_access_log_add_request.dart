// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'api_access_log_add_request.g.dart';

/// API访问日志创建请求
@JsonSerializable()
class ApiAccessLogAddRequest {
  const ApiAccessLogAddRequest({
    this.traceId,
    this.userId,
    this.method,
    this.path,
    this.query,
    this.status,
    this.latencyMs,
    this.clientIp,
    this.userAgent,
    this.referer,
    this.requestSize,
    this.responseSize,
  });
  
  factory ApiAccessLogAddRequest.fromJson(Map<String, Object?> json) => _$ApiAccessLogAddRequestFromJson(json);
  
  /// 链路追踪ID
  final String? traceId;

  /// 用户ID
  final int? userId;

  /// HTTP方法
  final String? method;

  /// 请求路径
  final String? path;

  /// 查询参数
  final String? query;

  /// 响应状态码
  final int? status;

  /// 耗时毫秒
  final int? latencyMs;

  /// 客户端IP
  final String? clientIp;

  /// User-Agent
  final String? userAgent;

  /// Referer
  final String? referer;

  /// 请求大小
  final int? requestSize;

  /// 响应大小
  final int? responseSize;

  Map<String, Object?> toJson() => _$ApiAccessLogAddRequestToJson(this);
}
