// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'user_email_code_request.g.dart';

/// 用户发送邮箱验证码请求
@JsonSerializable()
class UserEmailCodeRequest {
  const UserEmailCodeRequest({this.email});

  factory UserEmailCodeRequest.fromJson(Map<String, Object?> json) =>
      _$UserEmailCodeRequestFromJson(json);

  /// 邮箱
  final String? email;

  Map<String, Object?> toJson() => _$UserEmailCodeRequestToJson(this);
}

// Flutter compute serialization functions for UserEmailCodeRequest
FutureOr<UserEmailCodeRequest> deserializeUserEmailCodeRequest(
  Map<String, dynamic> json,
) => UserEmailCodeRequest.fromJson(json);

FutureOr<List<UserEmailCodeRequest>> deserializeUserEmailCodeRequestList(
  List<Map<String, dynamic>> json,
) => json.map((e) => UserEmailCodeRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeUserEmailCodeRequest(
  UserEmailCodeRequest? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeUserEmailCodeRequestList(
  List<UserEmailCodeRequest>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
