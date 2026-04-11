// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

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
    this.userEmail,
    this.maOpenId,
    this.wxUnionId,
    this.wxOpenId,
    this.appleId,
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

  /// 用户邮箱
  final String? userEmail;

  /// 微信小程序 OpenID
  final String? maOpenId;

  /// 微信 UnionID
  final String? wxUnionId;

  /// 微信 App OpenID (开放平台 Mobile App)
  final String? wxOpenId;

  /// Apple ID
  final String? appleId;

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

// Flutter compute serialization functions for User
FutureOr<User> deserializeUser(Map<String, dynamic> json) =>
    User.fromJson(json);

FutureOr<List<User>> deserializeUserList(List<Map<String, dynamic>> json) =>
    json.map((e) => User.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeUser(User? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeUserList(List<User>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
