// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'page_notification_vo.dart';

part 'base_response_page_notification_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponsePageNotificationVo {
  const BaseResponsePageNotificationVo({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponsePageNotificationVo.fromJson(Map<String, Object?> json) => _$BaseResponsePageNotificationVoFromJson(json);
  
  /// 状态码
  final int? code;
  final PageNotificationVo? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponsePageNotificationVoToJson(this);
}

// Flutter compute serialization functions for BaseResponsePageNotificationVo
FutureOr<BaseResponsePageNotificationVo> deserializeBaseResponsePageNotificationVo(Map<String, dynamic> json) =>
    BaseResponsePageNotificationVo.fromJson(json);

FutureOr<List<BaseResponsePageNotificationVo>> deserializeBaseResponsePageNotificationVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => BaseResponsePageNotificationVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponsePageNotificationVo(BaseResponsePageNotificationVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponsePageNotificationVoList(List<BaseResponsePageNotificationVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
