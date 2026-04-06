// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'user_login_log_query_request.g.dart';

/// 用户登录日志查询请求
@JsonSerializable()
class UserLoginLogQueryRequest {
  const UserLoginLogQueryRequest({
    this.current,
    this.pageSize,
    this.sortField,
    this.sortOrder,
    this.id,
    this.userId,
    this.account,
    this.loginType,
    this.status,
    this.clientIp,
    this.searchText,
  });
  
  factory UserLoginLogQueryRequest.fromJson(Map<String, Object?> json) => _$UserLoginLogQueryRequestFromJson(json);
  
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

  /// 用户ID
  final int? userId;

  /// 登录账号
  final String? account;

  /// 登录类型
  final String? loginType;

  /// 登录状态
  final String? status;

  /// 客户端IP
  final String? clientIp;

  /// 搜索文本
  final String? searchText;

  Map<String, Object?> toJson() => _$UserLoginLogQueryRequestToJson(this);
}
