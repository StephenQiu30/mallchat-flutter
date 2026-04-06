// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'notification_query_request.g.dart';

/// 查询通知请求
@JsonSerializable()
class NotificationQueryRequest {
  const NotificationQueryRequest({
    this.current,
    this.pageSize,
    this.sortField,
    this.sortOrder,
    this.id,
    this.type,
    this.userId,
    this.isRead,
    this.status,
    this.relatedType,
    this.searchText,
  });
  
  factory NotificationQueryRequest.fromJson(Map<String, Object?> json) => _$NotificationQueryRequestFromJson(json);
  
  /// 当前页号
  final int? current;

  /// 页面大小
  final int? pageSize;

  /// 排序字段
  final String? sortField;

  /// 排序顺序（默认升序）
  final String? sortOrder;

  /// 通知ID
  final int? id;

  /// 通知类型
  final String? type;

  /// 接收用户ID
  final int? userId;

  /// 是否已读
  final int? isRead;

  /// 状态
  final int? status;

  /// 关联对象类型
  final String? relatedType;

  /// 搜索文本
  final String? searchText;

  Map<String, Object?> toJson() => _$NotificationQueryRequestToJson(this);
}
