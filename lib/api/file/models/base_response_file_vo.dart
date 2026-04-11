// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'file_vo.dart';

part 'base_response_file_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseFileVo {
  const BaseResponseFileVo({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponseFileVo.fromJson(Map<String, Object?> json) => _$BaseResponseFileVoFromJson(json);
  
  /// 状态码
  final int? code;
  final FileVo? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseFileVoToJson(this);
}

// Flutter compute serialization functions for BaseResponseFileVo
FutureOr<BaseResponseFileVo> deserializeBaseResponseFileVo(Map<String, dynamic> json) =>
    BaseResponseFileVo.fromJson(json);

FutureOr<List<BaseResponseFileVo>> deserializeBaseResponseFileVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => BaseResponseFileVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponseFileVo(BaseResponseFileVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponseFileVoList(List<BaseResponseFileVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
