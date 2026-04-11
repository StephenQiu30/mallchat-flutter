// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'page_api_access_log_vo.dart';

part 'base_response_page_api_access_log_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponsePageApiAccessLogVo {
  const BaseResponsePageApiAccessLogVo({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponsePageApiAccessLogVo.fromJson(Map<String, Object?> json) => _$BaseResponsePageApiAccessLogVoFromJson(json);
  
  /// 状态码
  final int? code;
  final PageApiAccessLogVo? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponsePageApiAccessLogVoToJson(this);
}

// Flutter compute serialization functions for BaseResponsePageApiAccessLogVo
FutureOr<BaseResponsePageApiAccessLogVo> deserializeBaseResponsePageApiAccessLogVo(Map<String, dynamic> json) =>
    BaseResponsePageApiAccessLogVo.fromJson(json);

FutureOr<List<BaseResponsePageApiAccessLogVo>> deserializeBaseResponsePageApiAccessLogVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => BaseResponsePageApiAccessLogVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponsePageApiAccessLogVo(BaseResponsePageApiAccessLogVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponsePageApiAccessLogVoList(List<BaseResponsePageApiAccessLogVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
