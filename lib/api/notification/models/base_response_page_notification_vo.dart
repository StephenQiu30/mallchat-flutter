// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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
