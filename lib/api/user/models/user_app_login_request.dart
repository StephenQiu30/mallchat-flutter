// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'user_app_login_request.g.dart';

/// 用户微信 App 登录请求
@JsonSerializable()
class UserAppLoginRequest {
  const UserAppLoginRequest({this.code});

  factory UserAppLoginRequest.fromJson(Map<String, Object?> json) =>
      _$UserAppLoginRequestFromJson(json);

  /// 微信 App 登录 code
  final String? code;

  Map<String, Object?> toJson() => _$UserAppLoginRequestToJson(this);
}

// Flutter compute serialization functions for UserAppLoginRequest
FutureOr<UserAppLoginRequest> deserializeUserAppLoginRequest(
  Map<String, dynamic> json,
) => UserAppLoginRequest.fromJson(json);

FutureOr<List<UserAppLoginRequest>> deserializeUserAppLoginRequestList(
  List<Map<String, dynamic>> json,
) => json.map((e) => UserAppLoginRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeUserAppLoginRequest(
  UserAppLoginRequest? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeUserAppLoginRequestList(
  List<UserAppLoginRequest>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
