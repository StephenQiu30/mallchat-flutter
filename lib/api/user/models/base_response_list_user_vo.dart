// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'user_vo.dart';

part 'base_response_list_user_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseListUserVo {
  const BaseResponseListUserVo({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponseListUserVo.fromJson(Map<String, Object?> json) => _$BaseResponseListUserVoFromJson(json);
  
  /// 状态码
  final int? code;

  /// 数据
  final List<UserVo>? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseListUserVoToJson(this);
}

// Flutter compute serialization functions for BaseResponseListUserVo
FutureOr<BaseResponseListUserVo> deserializeBaseResponseListUserVo(Map<String, dynamic> json) =>
    BaseResponseListUserVo.fromJson(json);

FutureOr<List<BaseResponseListUserVo>> deserializeBaseResponseListUserVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => BaseResponseListUserVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponseListUserVo(BaseResponseListUserVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponseListUserVoList(List<BaseResponseListUserVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
