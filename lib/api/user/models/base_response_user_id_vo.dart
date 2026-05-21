// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'user_id_vo.dart';

part 'base_response_user_id_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseUserIdVo {
  const BaseResponseUserIdVo({this.code, this.data, this.message});

  factory BaseResponseUserIdVo.fromJson(Map<String, Object?> json) =>
      _$BaseResponseUserIdVoFromJson(json);

  /// 状态码
  final int? code;
  final UserIdVo? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseUserIdVoToJson(this);
}

// Flutter compute serialization functions for BaseResponseUserIdVo
FutureOr<BaseResponseUserIdVo> deserializeBaseResponseUserIdVo(
  Map<String, dynamic> json,
) => BaseResponseUserIdVo.fromJson(json);

FutureOr<List<BaseResponseUserIdVo>> deserializeBaseResponseUserIdVoList(
  List<Map<String, dynamic>> json,
) => json.map((e) => BaseResponseUserIdVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponseUserIdVo(
  BaseResponseUserIdVo? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponseUserIdVoList(
  List<BaseResponseUserIdVo>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
