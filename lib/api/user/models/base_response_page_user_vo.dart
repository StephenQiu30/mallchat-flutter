// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'page_user_vo.dart';

part 'base_response_page_user_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponsePageUserVo {
  const BaseResponsePageUserVo({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponsePageUserVo.fromJson(Map<String, Object?> json) => _$BaseResponsePageUserVoFromJson(json);
  
  /// 状态码
  final int? code;
  final PageUserVo? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponsePageUserVoToJson(this);
}

// Flutter compute serialization functions for BaseResponsePageUserVo
FutureOr<BaseResponsePageUserVo> deserializeBaseResponsePageUserVo(Map<String, dynamic> json) =>
    BaseResponsePageUserVo.fromJson(json);

FutureOr<List<BaseResponsePageUserVo>> deserializeBaseResponsePageUserVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => BaseResponsePageUserVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponsePageUserVo(BaseResponsePageUserVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponsePageUserVoList(List<BaseResponsePageUserVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
