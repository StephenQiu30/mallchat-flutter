// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// 用户表
@JsonSerializable()
class User {
  const User({
    this.id,
    this.userName,
    this.userAvatar,
    this.userProfile,
    this.userRole,
    this.userPhone,
    this.mpOpenId,
    this.wxUnionId,
    this.wxOpenId,
    this.githubId,
    this.githubLogin,
    this.githubUrl,
    this.lastLoginTime,
    this.lastLoginIp,
    this.createTime,
    this.updateTime,
    this.isDelete,
  });
  
  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
  
  /// 用户ID
  final int? id;

  /// 用户昵称
  final String? userName;

  /// 用户头像
  final String? userAvatar;

  /// 用户简介
  final String? userProfile;

  /// 用户角色：user/admin/ban
  final String? userRole;

  /// 用户手机号
  final String? userPhone;

  /// 微信公众号 OpenID
  final String? mpOpenId;

  /// 微信 UnionID
  final String? wxUnionId;

  /// 微信开放平台 OpenID
  final String? wxOpenId;

  /// GitHub ID
  final String? githubId;

  /// GitHub 账号
  final String? githubLogin;

  /// GitHub 主页
  final String? githubUrl;

  /// 最后登录时间
  final DateTime? lastLoginTime;

  /// 最后登录IP
  final String? lastLoginIp;

  /// 创建时间
  final DateTime? createTime;

  /// 更新时间
  final DateTime? updateTime;

  /// 是否删除
  final int? isDelete;

  Map<String, Object?> toJson() => _$UserToJson(this);
}
