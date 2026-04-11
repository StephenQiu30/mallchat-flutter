// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'user_add_request.g.dart';

/// 用户创建请求 (管理员)
@JsonSerializable()
class UserAddRequest {
  const UserAddRequest({
    this.userName,
    this.userAvatar,
    this.userRole,
    this.userEmail,
  });

  factory UserAddRequest.fromJson(Map<String, Object?> json) =>
      _$UserAddRequestFromJson(json);

  /// 用户昵称
  final String? userName;

  /// 用户头像
  final String? userAvatar;

  /// 用户角色
  final String? userRole;

  /// 用户邮箱
  final String? userEmail;

  Map<String, Object?> toJson() => _$UserAddRequestToJson(this);
}

// Flutter compute serialization functions for UserAddRequest
FutureOr<UserAddRequest> deserializeUserAddRequest(Map<String, dynamic> json) =>
    UserAddRequest.fromJson(json);

FutureOr<List<UserAddRequest>> deserializeUserAddRequestList(
  List<Map<String, dynamic>> json,
) => json.map((e) => UserAddRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeUserAddRequest(
  UserAddRequest? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeUserAddRequestList(
  List<UserAddRequest>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
