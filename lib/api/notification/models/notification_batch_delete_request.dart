// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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
