// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'api_access_log_vo.g.dart';

/// API访问日志
@JsonSerializable()
class ApiAccessLogVo {
  const ApiAccessLogVo({
    this.id,
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
    this.createTime,
  });
  
  factory ApiAccessLogVo.fromJson(Map<String, Object?> json) => _$ApiAccessLogVoFromJson(json);
  
  /// 主键
  final int? id;

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

  /// 请求耗时(ms)
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

  /// 创建时间
  final DateTime? createTime;

  Map<String, Object?> toJson() => _$ApiAccessLogVoToJson(this);
}

// Flutter compute serialization functions for ApiAccessLogVo
FutureOr<ApiAccessLogVo> deserializeApiAccessLogVo(Map<String, dynamic> json) =>
    ApiAccessLogVo.fromJson(json);

FutureOr<List<ApiAccessLogVo>> deserializeApiAccessLogVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => ApiAccessLogVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeApiAccessLogVo(ApiAccessLogVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeApiAccessLogVoList(List<ApiAccessLogVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
