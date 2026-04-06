// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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

  Map<String, Object?> toJson() => _$OperationLogAddRequestToJson(this);
}
