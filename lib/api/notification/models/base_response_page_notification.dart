// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'page_notification.dart';

part 'base_response_page_notification.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponsePageNotification {
  const BaseResponsePageNotification({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponsePageNotification.fromJson(Map<String, Object?> json) => _$BaseResponsePageNotificationFromJson(json);
  
  /// 状态码
  final int? code;
  final PageNotification? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponsePageNotificationToJson(this);
}

// Flutter compute serialization functions for BaseResponsePageNotification
FutureOr<BaseResponsePageNotification> deserializeBaseResponsePageNotification(Map<String, dynamic> json) =>
    BaseResponsePageNotification.fromJson(json);

FutureOr<List<BaseResponsePageNotification>> deserializeBaseResponsePageNotificationList(List<Map<String, dynamic>> json) =>
    json.map((e) => BaseResponsePageNotification.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponsePageNotification(BaseResponsePageNotification? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponsePageNotificationList(List<BaseResponsePageNotification>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
