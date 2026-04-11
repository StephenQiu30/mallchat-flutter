// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'notification_update_request.g.dart';

/// 更新通知请求
@JsonSerializable()
class NotificationUpdateRequest {
  const NotificationUpdateRequest({
    this.id,
    this.title,
    this.content,
    this.type,
    this.userId,
    this.relatedId,
    this.relatedType,
    this.contentUrl,
  });
  
  factory NotificationUpdateRequest.fromJson(Map<String, Object?> json) => _$NotificationUpdateRequestFromJson(json);
  
  /// 通知ID
  final int? id;

  /// 通知标题
  final String? title;

  /// 通知内容
  final String? content;

  /// 通知类型
  final String? type;

  /// 接收用户ID
  final int? userId;

  /// 关联对象ID
  final int? relatedId;

  /// 关联对象类型
  final String? relatedType;

  /// 跳转链接
  final String? contentUrl;

  Map<String, Object?> toJson() => _$NotificationUpdateRequestToJson(this);
}

// Flutter compute serialization functions for NotificationUpdateRequest
FutureOr<NotificationUpdateRequest> deserializeNotificationUpdateRequest(Map<String, dynamic> json) =>
    NotificationUpdateRequest.fromJson(json);

FutureOr<List<NotificationUpdateRequest>> deserializeNotificationUpdateRequestList(List<Map<String, dynamic>> json) =>
    json.map((e) => NotificationUpdateRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeNotificationUpdateRequest(NotificationUpdateRequest? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeNotificationUpdateRequestList(List<NotificationUpdateRequest>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
