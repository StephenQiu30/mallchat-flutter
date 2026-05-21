// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'user_admin_status_vo.g.dart';

/// 用户管理员状态
@JsonSerializable()
class UserAdminStatusVo {
  const UserAdminStatusVo({this.admin});

  factory UserAdminStatusVo.fromJson(Map<String, Object?> json) =>
      _$UserAdminStatusVoFromJson(json);

  /// 是否管理员
  final bool? admin;

  Map<String, Object?> toJson() => _$UserAdminStatusVoToJson(this);
}

// Flutter compute serialization functions for UserAdminStatusVo
FutureOr<UserAdminStatusVo> deserializeUserAdminStatusVo(
  Map<String, dynamic> json,
) => UserAdminStatusVo.fromJson(json);

FutureOr<List<UserAdminStatusVo>> deserializeUserAdminStatusVoList(
  List<Map<String, dynamic>> json,
) => json.map((e) => UserAdminStatusVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeUserAdminStatusVo(
  UserAdminStatusVo? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeUserAdminStatusVoList(
  List<UserAdminStatusVo>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
