// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'notification.dart';
import 'order_item.dart';
import 'page_notification.dart';

part 'page_notification.g.dart';

/// 数据
@JsonSerializable()
class PageNotification {
  const PageNotification({
    this.records,
    this.total,
    this.size,
    this.current,
    this.orders,
    this.optimizeCountSql,
    this.searchCount,
    this.optimizeJoinOfCountSql,
    this.maxLimit,
    this.countId,
    this.pages,
  });
  
  factory PageNotification.fromJson(Map<String, Object?> json) => _$PageNotificationFromJson(json);
  
  final List<Notification>? records;
  final int? total;
  final int? size;
  final int? current;
  final List<OrderItem>? orders;
  final PageNotification? optimizeCountSql;
  final PageNotification? searchCount;
  final bool? optimizeJoinOfCountSql;
  final int? maxLimit;
  final String? countId;
  final int? pages;

  Map<String, Object?> toJson() => _$PageNotificationToJson(this);
}
