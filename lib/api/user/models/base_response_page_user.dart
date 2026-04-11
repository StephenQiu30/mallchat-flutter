// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'page_user.dart';

part 'base_response_page_user.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponsePageUser {
  const BaseResponsePageUser({this.code, this.data, this.message});

  factory BaseResponsePageUser.fromJson(Map<String, Object?> json) =>
      _$BaseResponsePageUserFromJson(json);

  /// 状态码
  final int? code;
  final PageUser? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponsePageUserToJson(this);
}

// Flutter compute serialization functions for BaseResponsePageUser
FutureOr<BaseResponsePageUser> deserializeBaseResponsePageUser(
  Map<String, dynamic> json,
) => BaseResponsePageUser.fromJson(json);

FutureOr<List<BaseResponsePageUser>> deserializeBaseResponsePageUserList(
  List<Map<String, dynamic>> json,
) => json.map((e) => BaseResponsePageUser.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponsePageUser(
  BaseResponsePageUser? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponsePageUserList(
  List<BaseResponsePageUser>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
