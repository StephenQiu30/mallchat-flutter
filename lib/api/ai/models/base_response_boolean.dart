// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'base_response_boolean.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseBoolean {
  const BaseResponseBoolean({this.code, this.data, this.message});

  factory BaseResponseBoolean.fromJson(Map<String, Object?> json) =>
      _$BaseResponseBooleanFromJson(json);

  /// 状态码
  final int? code;

  /// 数据
  final bool? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseBooleanToJson(this);
}

// Flutter compute serialization functions for BaseResponseBoolean
FutureOr<BaseResponseBoolean> deserializeBaseResponseBoolean(
  Map<String, dynamic> json,
) => BaseResponseBoolean.fromJson(json);

FutureOr<List<BaseResponseBoolean>> deserializeBaseResponseBooleanList(
  List<Map<String, dynamic>> json,
) => json.map((e) => BaseResponseBoolean.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponseBoolean(
  BaseResponseBoolean? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponseBooleanList(
  List<BaseResponseBoolean>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
