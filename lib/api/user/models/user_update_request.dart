// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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

  Map<String, Object?> toJson() => _$UserUpdateRequestToJson(this);
}
