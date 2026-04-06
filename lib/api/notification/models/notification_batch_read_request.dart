// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'notification_batch_read_request.g.dart';

/// 批量标记已读请求
@JsonSerializable()
class NotificationBatchReadRequest {
  const NotificationBatchReadRequest({
    required this.ids,
  });
  
  factory NotificationBatchReadRequest.fromJson(Map<String, Object?> json) => _$NotificationBatchReadRequestFromJson(json);
  
  /// 通知ID列表
  final List<int> ids;

  Map<String, Object?> toJson() => _$NotificationBatchReadRequestToJson(this);
}
