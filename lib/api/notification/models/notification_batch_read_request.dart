// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'notification_batch_read_request.g.dart';

/// 批量标记已读请求
@JsonSerializable()
class NotificationBatchReadRequest {
  const NotificationBatchReadRequest({required this.ids});

  factory NotificationBatchReadRequest.fromJson(Map<String, Object?> json) =>
      _$NotificationBatchReadRequestFromJson(json);

  /// 通知ID列表
  final List<int> ids;

  Map<String, Object?> toJson() => _$NotificationBatchReadRequestToJson(this);
}

// Flutter compute serialization functions for NotificationBatchReadRequest
FutureOr<NotificationBatchReadRequest> deserializeNotificationBatchReadRequest(
  Map<String, dynamic> json,
) => NotificationBatchReadRequest.fromJson(json);

FutureOr<List<NotificationBatchReadRequest>>
deserializeNotificationBatchReadRequestList(List<Map<String, dynamic>> json) =>
    json.map((e) => NotificationBatchReadRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeNotificationBatchReadRequest(
  NotificationBatchReadRequest? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeNotificationBatchReadRequestList(
  List<NotificationBatchReadRequest>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
