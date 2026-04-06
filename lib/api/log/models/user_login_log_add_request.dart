// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'user_login_log_add_request.g.dart';

/// 用户登录日志创建请求
@JsonSerializable()
class UserLoginLogAddRequest {
  const UserLoginLogAddRequest({
    this.userId,
    this.account,
    this.loginType,
    this.status,
    this.failReason,
    this.clientIp,
    this.location,
    this.userAgent,
  });
  
  factory UserLoginLogAddRequest.fromJson(Map<String, Object?> json) => _$UserLoginLogAddRequestFromJson(json);
  
  /// 用户ID
  final int? userId;

  /// 登录账号
  final String? account;

  /// 登录类型
  final String? loginType;

  /// 登录状态
  final String? status;

  /// 失败原因
  final String? failReason;

  /// 客户端IP
  final String? clientIp;

  /// 归属地
  final String? location;

  /// User-Agent
  final String? userAgent;

  Map<String, Object?> toJson() => _$UserLoginLogAddRequestToJson(this);
}
