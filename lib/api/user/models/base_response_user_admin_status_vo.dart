// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'user_admin_status_vo.dart';

part 'base_response_user_admin_status_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseUserAdminStatusVo {
  const BaseResponseUserAdminStatusVo({this.code, this.data, this.message});

  factory BaseResponseUserAdminStatusVo.fromJson(Map<String, Object?> json) =>
      _$BaseResponseUserAdminStatusVoFromJson(json);

  /// 状态码
  final int? code;
  final UserAdminStatusVo? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseUserAdminStatusVoToJson(this);
}

// Flutter compute serialization functions for BaseResponseUserAdminStatusVo
FutureOr<BaseResponseUserAdminStatusVo>
deserializeBaseResponseUserAdminStatusVo(Map<String, dynamic> json) =>
    BaseResponseUserAdminStatusVo.fromJson(json);

FutureOr<List<BaseResponseUserAdminStatusVo>>
deserializeBaseResponseUserAdminStatusVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => BaseResponseUserAdminStatusVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponseUserAdminStatusVo(
  BaseResponseUserAdminStatusVo? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponseUserAdminStatusVoList(
  List<BaseResponseUserAdminStatusVo>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
