// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'notification_add_request.g.dart';

/// 创建通知请求
@JsonSerializable()
class NotificationAddRequest {
  const NotificationAddRequest({
    this.target,
    this.title,
    this.content,
    this.contentUrl,
  });
  
  factory NotificationAddRequest.fromJson(Map<String, Object?> json) => _$NotificationAddRequestFromJson(json);
  
  /// 发送目标标识
  final String? target;

  /// 通知标题
  final String? title;

  /// 通知内容
  final String? content;

  /// 跳转链接
  final String? contentUrl;

  Map<String, Object?> toJson() => _$NotificationAddRequestToJson(this);
}

// Flutter compute serialization functions for NotificationAddRequest
FutureOr<NotificationAddRequest> deserializeNotificationAddRequest(Map<String, dynamic> json) =>
    NotificationAddRequest.fromJson(json);

FutureOr<List<NotificationAddRequest>> deserializeNotificationAddRequestList(List<Map<String, dynamic>> json) =>
    json.map((e) => NotificationAddRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeNotificationAddRequest(NotificationAddRequest? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeNotificationAddRequestList(List<NotificationAddRequest>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
