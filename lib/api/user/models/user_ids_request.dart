// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'user_ids_request.g.dart';

/// 用户ID列表请求
@JsonSerializable()
class UserIdsRequest {
  const UserIdsRequest({required this.ids});

  factory UserIdsRequest.fromJson(Map<String, Object?> json) =>
      _$UserIdsRequestFromJson(json);

  /// 用户ID列表
  final List<int> ids;

  Map<String, Object?> toJson() => _$UserIdsRequestToJson(this);
}

// Flutter compute serialization functions for UserIdsRequest
FutureOr<UserIdsRequest> deserializeUserIdsRequest(Map<String, dynamic> json) =>
    UserIdsRequest.fromJson(json);

FutureOr<List<UserIdsRequest>> deserializeUserIdsRequestList(
  List<Map<String, dynamic>> json,
) => json.map((e) => UserIdsRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeUserIdsRequest(
  UserIdsRequest? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeUserIdsRequestList(
  List<UserIdsRequest>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
