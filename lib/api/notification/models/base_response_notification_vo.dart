// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'notification_vo.dart';

part 'base_response_notification_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseNotificationVo {
  const BaseResponseNotificationVo({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponseNotificationVo.fromJson(Map<String, Object?> json) => _$BaseResponseNotificationVoFromJson(json);
  
  /// 状态码
  final int? code;
  final NotificationVo? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseNotificationVoToJson(this);
}
