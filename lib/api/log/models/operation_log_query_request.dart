// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'operation_log_query_request.g.dart';

/// 操作日志查询请求
@JsonSerializable()
class OperationLogQueryRequest {
  const OperationLogQueryRequest({
    this.current,
    this.pageSize,
    this.sortField,
    this.sortOrder,
    this.id,
    this.operatorId,
    this.operatorName,
    this.module,
    this.action,
    this.success,
    this.clientIp,
    this.searchText,
  });

  factory OperationLogQueryRequest.fromJson(Map<String, Object?> json) =>
      _$OperationLogQueryRequestFromJson(json);

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

  /// 操作人ID
  final int? operatorId;

  /// 操作人名称
  final String? operatorName;

  /// 模块
  final String? module;

  /// 操作类型
  final String? action;

  /// 是否成功
  final int? success;

  /// 客户端IP
  final String? clientIp;

  /// 搜索文本
  final String? searchText;

  Map<String, Object?> toJson() => _$OperationLogQueryRequestToJson(this);
}

// Flutter compute serialization functions for OperationLogQueryRequest
FutureOr<OperationLogQueryRequest> deserializeOperationLogQueryRequest(
  Map<String, dynamic> json,
) => OperationLogQueryRequest.fromJson(json);

FutureOr<List<OperationLogQueryRequest>>
deserializeOperationLogQueryRequestList(List<Map<String, dynamic>> json) =>
    json.map((e) => OperationLogQueryRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeOperationLogQueryRequest(
  OperationLogQueryRequest? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeOperationLogQueryRequestList(
  List<OperationLogQueryRequest>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
