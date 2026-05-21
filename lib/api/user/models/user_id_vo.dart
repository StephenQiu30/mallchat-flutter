// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'user_id_vo.g.dart';

/// 用户ID响应
@JsonSerializable()
class UserIdVo {
  const UserIdVo({this.id});

  factory UserIdVo.fromJson(Map<String, Object?> json) =>
      _$UserIdVoFromJson(json);

  /// 用户ID
  final int? id;

  Map<String, Object?> toJson() => _$UserIdVoToJson(this);
}

// Flutter compute serialization functions for UserIdVo
FutureOr<UserIdVo> deserializeUserIdVo(Map<String, dynamic> json) =>
    UserIdVo.fromJson(json);

FutureOr<List<UserIdVo>> deserializeUserIdVoList(
  List<Map<String, dynamic>> json,
) => json.map((e) => UserIdVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeUserIdVo(UserIdVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeUserIdVoList(
  List<UserIdVo>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
