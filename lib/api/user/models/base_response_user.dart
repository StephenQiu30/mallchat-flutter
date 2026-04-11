// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'base_response_user.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseUser {
  const BaseResponseUser({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponseUser.fromJson(Map<String, Object?> json) => _$BaseResponseUserFromJson(json);
  
  /// 状态码
  final int? code;
  final User? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseUserToJson(this);
}

// Flutter compute serialization functions for BaseResponseUser
FutureOr<BaseResponseUser> deserializeBaseResponseUser(Map<String, dynamic> json) =>
    BaseResponseUser.fromJson(json);

FutureOr<List<BaseResponseUser>> deserializeBaseResponseUserList(List<Map<String, dynamic>> json) =>
    json.map((e) => BaseResponseUser.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponseUser(BaseResponseUser? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponseUserList(List<BaseResponseUser>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
