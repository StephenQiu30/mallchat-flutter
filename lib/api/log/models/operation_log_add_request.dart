// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'operation_log_add_request.g.dart';

/// 操作日志创建请求
@JsonSerializable()
class OperationLogAddRequest {
  const OperationLogAddRequest({
    this.operatorId,
    this.operatorName,
    this.module,
    this.action,
    this.method,
    this.path,
    this.requestParams,
    this.responseStatus,
    this.success,
    this.errorMessage,
    this.clientIp,
    this.location,
    this.userAgent,
  });
  
  factory OperationLogAddRequest.fromJson(Map<String, Object?> json) => _$OperationLogAddRequestFromJson(json);
  
  /// 操作人ID
  final int? operatorId;

  /// 操作人名称
  final String? operatorName;

  /// 模块
  final String? module;

  /// 操作类型
  final String? action;

  /// HTTP方法
  final String? method;

  /// 请求路径
  final String? path;

  /// 请求参数
  final String? requestParams;

  /// 响应状态码
  final int? responseStatus;

  /// 是否成功
  final int? success;

  /// 错误信息
  final String? errorMessage;

  /// 客户端IP
  final String? clientIp;

  /// 归属地
  final String? location;

  /// 浏览器标识
  final String? userAgent;

  Map<String, Object?> toJson() => _$OperationLogAddRequestToJson(this);
}

// Flutter compute serialization functions for OperationLogAddRequest
FutureOr<OperationLogAddRequest> deserializeOperationLogAddRequest(Map<String, dynamic> json) =>
    OperationLogAddRequest.fromJson(json);

FutureOr<List<OperationLogAddRequest>> deserializeOperationLogAddRequestList(List<Map<String, dynamic>> json) =>
    json.map((e) => OperationLogAddRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeOperationLogAddRequest(OperationLogAddRequest? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeOperationLogAddRequestList(List<OperationLogAddRequest>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
