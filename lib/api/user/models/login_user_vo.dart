// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'login_user_vo.g.dart';

/// 登录用户信息
@JsonSerializable()
class LoginUserVo {
  const LoginUserVo({
    this.id,
    this.userName,
    this.userAvatar,
    this.userRole,
    this.userProfile,
    this.githubLogin,
    this.githubUrl,
    this.userPhone,
    this.lastLoginTime,
    this.createTime,
    this.updateTime,
    this.token,
  });
  
  factory LoginUserVo.fromJson(Map<String, Object?> json) => _$LoginUserVoFromJson(json);
  
  /// 用户ID
  final int? id;

  /// 用户昵称
  final String? userName;

  /// 用户头像
  final String? userAvatar;

  /// 用户角色
  final String? userRole;

  /// 用户简介
  final String? userProfile;

  /// GitHub用户名
  final String? githubLogin;

  /// GitHub主页
  final String? githubUrl;

  /// 用户电话
  final String? userPhone;

  /// 最后登录时间
  final DateTime? lastLoginTime;

  /// 创建时间
  final DateTime? createTime;

  /// 更新时间
  final DateTime? updateTime;

  /// 登录token
  final String? token;

  Map<String, Object?> toJson() => _$LoginUserVoToJson(this);
}
