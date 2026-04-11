// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'user_vo.g.dart';

/// 用户视图对象
@JsonSerializable()
class UserVo {
  const UserVo({
    this.id,
    this.userName,
    this.userAvatar,
    this.userProfile,
    this.userRole,
    this.userPhone,
    this.userEmail,
    this.createTime,
    this.updateTime,
  });
  
  factory UserVo.fromJson(Map<String, Object?> json) => _$UserVoFromJson(json);
  
  /// 用户ID
  final int? id;

  /// 用户昵称
  final String? userName;

  /// 用户头像
  final String? userAvatar;

  /// 用户简介
  final String? userProfile;

  /// 用户角色
  final String? userRole;

  /// 用户电话
  final String? userPhone;

  /// 用户邮箱
  final String? userEmail;

  /// 创建时间
  final DateTime? createTime;

  /// 更新时间
  final DateTime? updateTime;

  Map<String, Object?> toJson() => _$UserVoToJson(this);
}

// Flutter compute serialization functions for UserVo
FutureOr<UserVo> deserializeUserVo(Map<String, dynamic> json) =>
    UserVo.fromJson(json);

FutureOr<List<UserVo>> deserializeUserVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => UserVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeUserVo(UserVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeUserVoList(List<UserVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
