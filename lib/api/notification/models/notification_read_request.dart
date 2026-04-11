// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'notification_read_request.g.dart';

/// 标记已读请求
@JsonSerializable()
class NotificationReadRequest {
  const NotificationReadRequest({this.id});

  factory NotificationReadRequest.fromJson(Map<String, Object?> json) =>
      _$NotificationReadRequestFromJson(json);

  /// 通知ID
  final int? id;

  Map<String, Object?> toJson() => _$NotificationReadRequestToJson(this);
}

// Flutter compute serialization functions for NotificationReadRequest
FutureOr<NotificationReadRequest> deserializeNotificationReadRequest(
  Map<String, dynamic> json,
) => NotificationReadRequest.fromJson(json);

FutureOr<List<NotificationReadRequest>> deserializeNotificationReadRequestList(
  List<Map<String, dynamic>> json,
) => json.map((e) => NotificationReadRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeNotificationReadRequest(
  NotificationReadRequest? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeNotificationReadRequestList(
  List<NotificationReadRequest>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
