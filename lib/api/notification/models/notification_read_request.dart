// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'notification_read_request.g.dart';

/// 标记已读请求
@JsonSerializable()
class NotificationReadRequest {
  const NotificationReadRequest({
    this.id,
  });
  
  factory NotificationReadRequest.fromJson(Map<String, Object?> json) => _$NotificationReadRequestFromJson(json);
  
  /// 通知ID
  final int? id;

  Map<String, Object?> toJson() => _$NotificationReadRequestToJson(this);
}
