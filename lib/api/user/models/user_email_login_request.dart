// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'user_email_login_request.g.dart';

/// 用户邮箱登录请求
@JsonSerializable()
class UserEmailLoginRequest {
  const UserEmailLoginRequest({
    this.email,
    this.code,
  });
  
  factory UserEmailLoginRequest.fromJson(Map<String, Object?> json) => _$UserEmailLoginRequestFromJson(json);
  
  /// 邮箱
  final String? email;

  /// 验证码
  final String? code;

  Map<String, Object?> toJson() => _$UserEmailLoginRequestToJson(this);
}

// Flutter compute serialization functions for UserEmailLoginRequest
FutureOr<UserEmailLoginRequest> deserializeUserEmailLoginRequest(Map<String, dynamic> json) =>
    UserEmailLoginRequest.fromJson(json);

FutureOr<List<UserEmailLoginRequest>> deserializeUserEmailLoginRequestList(List<Map<String, dynamic>> json) =>
    json.map((e) => UserEmailLoginRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeUserEmailLoginRequest(UserEmailLoginRequest? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeUserEmailLoginRequestList(List<UserEmailLoginRequest>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
