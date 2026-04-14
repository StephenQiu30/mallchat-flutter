// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'notification_vo.dart';

part 'base_response_notification_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseNotificationVo {
  const BaseResponseNotificationVo({this.code, this.data, this.message});

  factory BaseResponseNotificationVo.fromJson(Map<String, Object?> json) =>
      _$BaseResponseNotificationVoFromJson(json);

  /// 状态码
  final int? code;
  final NotificationVo? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseNotificationVoToJson(this);
}

// Flutter compute serialization functions for BaseResponseNotificationVo
FutureOr<BaseResponseNotificationVo> deserializeBaseResponseNotificationVo(
  Map<String, dynamic> json,
) => BaseResponseNotificationVo.fromJson(json);

FutureOr<List<BaseResponseNotificationVo>>
deserializeBaseResponseNotificationVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => BaseResponseNotificationVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponseNotificationVo(
  BaseResponseNotificationVo? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponseNotificationVoList(
  List<BaseResponseNotificationVo>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
