// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'notification_batch_delete_request.g.dart';

/// 批量删除通知请求
@JsonSerializable()
class NotificationBatchDeleteRequest {
  const NotificationBatchDeleteRequest({
    required this.ids,
  });
  
  factory NotificationBatchDeleteRequest.fromJson(Map<String, Object?> json) => _$NotificationBatchDeleteRequestFromJson(json);
  
  /// 通知ID列表
  final List<int> ids;

  Map<String, Object?> toJson() => _$NotificationBatchDeleteRequestToJson(this);
}

// Flutter compute serialization functions for NotificationBatchDeleteRequest
FutureOr<NotificationBatchDeleteRequest> deserializeNotificationBatchDeleteRequest(Map<String, dynamic> json) =>
    NotificationBatchDeleteRequest.fromJson(json);

FutureOr<List<NotificationBatchDeleteRequest>> deserializeNotificationBatchDeleteRequestList(List<Map<String, dynamic>> json) =>
    json.map((e) => NotificationBatchDeleteRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeNotificationBatchDeleteRequest(NotificationBatchDeleteRequest? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeNotificationBatchDeleteRequestList(List<NotificationBatchDeleteRequest>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
