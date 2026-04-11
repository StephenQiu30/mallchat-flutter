// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'user_apple_login_request.g.dart';

/// 用户 Apple 登录请求
@JsonSerializable()
class UserAppleLoginRequest {
  const UserAppleLoginRequest({
    required this.identityToken,
    required this.userIdentifier,
  });

  factory UserAppleLoginRequest.fromJson(Map<String, Object?> json) =>
      _$UserAppleLoginRequestFromJson(json);

  /// Apple Identity Token (JWT)
  final String identityToken;

  /// Apple 用户标识 (User Identifier)
  final String userIdentifier;

  Map<String, Object?> toJson() => _$UserAppleLoginRequestToJson(this);
}

// Flutter compute serialization functions for UserAppleLoginRequest
FutureOr<UserAppleLoginRequest> deserializeUserAppleLoginRequest(
  Map<String, dynamic> json,
) => UserAppleLoginRequest.fromJson(json);

FutureOr<List<UserAppleLoginRequest>> deserializeUserAppleLoginRequestList(
  List<Map<String, dynamic>> json,
) => json.map((e) => UserAppleLoginRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeUserAppleLoginRequest(
  UserAppleLoginRequest? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeUserAppleLoginRequestList(
  List<UserAppleLoginRequest>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
