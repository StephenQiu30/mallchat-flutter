// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'user_add_request.g.dart';

/// 用户创建请求 (管理员)
@JsonSerializable()
class UserAddRequest {
  const UserAddRequest({
    this.userName,
    this.userAvatar,
    this.userRole,
  });
  
  factory UserAddRequest.fromJson(Map<String, Object?> json) => _$UserAddRequestFromJson(json);
  
  /// 用户昵称
  final String? userName;

  /// 用户头像
  final String? userAvatar;

  /// 用户角色
  final String? userRole;

  Map<String, Object?> toJson() => _$UserAddRequestToJson(this);
}
