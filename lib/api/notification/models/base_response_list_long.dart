// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'base_response_list_long.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseListLong {
  const BaseResponseListLong({this.code, this.data, this.message});

  factory BaseResponseListLong.fromJson(Map<String, Object?> json) =>
      _$BaseResponseListLongFromJson(json);

  /// 状态码
  final int? code;

  /// 数据
  final List<int>? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseListLongToJson(this);
}

// Flutter compute serialization functions for BaseResponseListLong
FutureOr<BaseResponseListLong> deserializeBaseResponseListLong(
  Map<String, dynamic> json,
) => BaseResponseListLong.fromJson(json);

FutureOr<List<BaseResponseListLong>> deserializeBaseResponseListLongList(
  List<Map<String, dynamic>> json,
) => json.map((e) => BaseResponseListLong.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponseListLong(
  BaseResponseListLong? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponseListLongList(
  List<BaseResponseListLong>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
