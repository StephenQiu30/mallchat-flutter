// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'base_response_long.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseLong {
  const BaseResponseLong({this.code, this.data, this.message});

  factory BaseResponseLong.fromJson(Map<String, Object?> json) =>
      _$BaseResponseLongFromJson(json);

  /// 状态码
  final int? code;

  /// 数据
  final int? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseLongToJson(this);
}

// Flutter compute serialization functions for BaseResponseLong
FutureOr<BaseResponseLong> deserializeBaseResponseLong(
  Map<String, dynamic> json,
) => BaseResponseLong.fromJson(json);

FutureOr<List<BaseResponseLong>> deserializeBaseResponseLongList(
  List<Map<String, dynamic>> json,
) => json.map((e) => BaseResponseLong.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponseLong(
  BaseResponseLong? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponseLongList(
  List<BaseResponseLong>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
