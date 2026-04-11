// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'user_ma_login_request.g.dart';

/// 用户微信小程序登录请求
@JsonSerializable()
class UserMaLoginRequest {
  const UserMaLoginRequest({
    this.code,
  });
  
  factory UserMaLoginRequest.fromJson(Map<String, Object?> json) => _$UserMaLoginRequestFromJson(json);
  
  /// 微信小程序登录 code
  final String? code;

  Map<String, Object?> toJson() => _$UserMaLoginRequestToJson(this);
}

// Flutter compute serialization functions for UserMaLoginRequest
FutureOr<UserMaLoginRequest> deserializeUserMaLoginRequest(Map<String, dynamic> json) =>
    UserMaLoginRequest.fromJson(json);

FutureOr<List<UserMaLoginRequest>> deserializeUserMaLoginRequestList(List<Map<String, dynamic>> json) =>
    json.map((e) => UserMaLoginRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeUserMaLoginRequest(UserMaLoginRequest? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeUserMaLoginRequestList(List<UserMaLoginRequest>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
