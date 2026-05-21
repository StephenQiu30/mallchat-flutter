// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'user_id_request.g.dart';

/// 用户ID请求
@JsonSerializable()
class UserIdRequest {
  const UserIdRequest({required this.id});

  factory UserIdRequest.fromJson(Map<String, Object?> json) =>
      _$UserIdRequestFromJson(json);

  /// 用户ID
  final int id;

  Map<String, Object?> toJson() => _$UserIdRequestToJson(this);
}

// Flutter compute serialization functions for UserIdRequest
FutureOr<UserIdRequest> deserializeUserIdRequest(Map<String, dynamic> json) =>
    UserIdRequest.fromJson(json);

FutureOr<List<UserIdRequest>> deserializeUserIdRequestList(
  List<Map<String, dynamic>> json,
) => json.map((e) => UserIdRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeUserIdRequest(UserIdRequest? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeUserIdRequestList(
  List<UserIdRequest>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
