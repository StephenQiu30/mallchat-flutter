// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'user_login_log_vo.g.dart';

/// 用户登录日志
@JsonSerializable()
class UserLoginLogVo {
  const UserLoginLogVo({
    this.id,
    this.userId,
    this.account,
    this.loginType,
    this.status,
    this.failReason,
    this.clientIp,
    this.location,
    this.userAgent,
    this.createTime,
  });
  
  factory UserLoginLogVo.fromJson(Map<String, Object?> json) => _$UserLoginLogVoFromJson(json);
  
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

  /// 失败原因
  final String? failReason;

  /// 客户端IP
  final String? clientIp;

  /// 归属地
  final String? location;

  /// User-Agent
  final String? userAgent;

  /// 创建时间
  final DateTime? createTime;

  Map<String, Object?> toJson() => _$UserLoginLogVoToJson(this);
}
