// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'notification_vo.dart';
import 'order_item.dart';
import 'page_notification_vo.dart';

part 'page_notification_vo.g.dart';

/// 数据
@JsonSerializable()
class PageNotificationVo {
  const PageNotificationVo({
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

  factory PageNotificationVo.fromJson(Map<String, Object?> json) =>
      _$PageNotificationVoFromJson(json);

  final List<NotificationVo>? records;
  final int? total;
  final int? size;
  final int? current;
  final List<OrderItem>? orders;
  final PageNotificationVo? optimizeCountSql;
  final PageNotificationVo? searchCount;
  final bool? optimizeJoinOfCountSql;
  final int? maxLimit;
  final String? countId;
  final int? pages;

  Map<String, Object?> toJson() => _$PageNotificationVoToJson(this);
}

// Flutter compute serialization functions for PageNotificationVo
FutureOr<PageNotificationVo> deserializePageNotificationVo(
  Map<String, dynamic> json,
) => PageNotificationVo.fromJson(json);

FutureOr<List<PageNotificationVo>> deserializePageNotificationVoList(
  List<Map<String, dynamic>> json,
) => json.map((e) => PageNotificationVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializePageNotificationVo(
  PageNotificationVo? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializePageNotificationVoList(
  List<PageNotificationVo>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
