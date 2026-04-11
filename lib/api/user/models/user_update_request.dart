// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'user_update_request.g.dart';

/// 用户更新请求 (管理员)
@JsonSerializable()
class UserUpdateRequest {
  const UserUpdateRequest({
    this.id,
    this.userName,
    this.userAvatar,
    this.userProfile,
    this.userRole,
    this.userPhone,
    this.userEmail,
  });
  
  factory UserUpdateRequest.fromJson(Map<String, Object?> json) => _$UserUpdateRequestFromJson(json);
  
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

  Map<String, Object?> toJson() => _$UserUpdateRequestToJson(this);
}

// Flutter compute serialization functions for UserUpdateRequest
FutureOr<UserUpdateRequest> deserializeUserUpdateRequest(Map<String, dynamic> json) =>
    UserUpdateRequest.fromJson(json);

FutureOr<List<UserUpdateRequest>> deserializeUserUpdateRequestList(List<Map<String, dynamic>> json) =>
    json.map((e) => UserUpdateRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeUserUpdateRequest(UserUpdateRequest? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeUserUpdateRequestList(List<UserUpdateRequest>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
