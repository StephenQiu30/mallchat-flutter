// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'base_response_integer.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseInteger {
  const BaseResponseInteger({this.code, this.data, this.message});

  factory BaseResponseInteger.fromJson(Map<String, Object?> json) =>
      _$BaseResponseIntegerFromJson(json);

  /// 状态码
  final int? code;

  /// 数据
  final int? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseIntegerToJson(this);
}

// Flutter compute serialization functions for BaseResponseInteger
FutureOr<BaseResponseInteger> deserializeBaseResponseInteger(
  Map<String, dynamic> json,
) => BaseResponseInteger.fromJson(json);

FutureOr<List<BaseResponseInteger>> deserializeBaseResponseIntegerList(
  List<Map<String, dynamic>> json,
) => json.map((e) => BaseResponseInteger.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponseInteger(
  BaseResponseInteger? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponseIntegerList(
  List<BaseResponseInteger>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
