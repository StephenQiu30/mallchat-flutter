// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'api_access_log_query_request.g.dart';

/// API访问日志查询请求
@JsonSerializable()
class ApiAccessLogQueryRequest {
  const ApiAccessLogQueryRequest({
    this.current,
    this.pageSize,
    this.sortField,
    this.sortOrder,
    this.id,
    this.traceId,
    this.userId,
    this.method,
    this.path,
    this.status,
    this.clientIp,
    this.searchText,
  });
  
  factory ApiAccessLogQueryRequest.fromJson(Map<String, Object?> json) => _$ApiAccessLogQueryRequestFromJson(json);
  
  /// 当前页号
  final int? current;

  /// 页面大小
  final int? pageSize;

  /// 排序字段
  final String? sortField;

  /// 排序顺序（默认升序）
  final String? sortOrder;

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

  /// 响应状态码
  final int? status;

  /// 客户端IP
  final String? clientIp;

  /// 搜索文本
  final String? searchText;

  Map<String, Object?> toJson() => _$ApiAccessLogQueryRequestToJson(this);
}

// Flutter compute serialization functions for ApiAccessLogQueryRequest
FutureOr<ApiAccessLogQueryRequest> deserializeApiAccessLogQueryRequest(Map<String, dynamic> json) =>
    ApiAccessLogQueryRequest.fromJson(json);

FutureOr<List<ApiAccessLogQueryRequest>> deserializeApiAccessLogQueryRequestList(List<Map<String, dynamic>> json) =>
    json.map((e) => ApiAccessLogQueryRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeApiAccessLogQueryRequest(ApiAccessLogQueryRequest? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeApiAccessLogQueryRequestList(List<ApiAccessLogQueryRequest>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
