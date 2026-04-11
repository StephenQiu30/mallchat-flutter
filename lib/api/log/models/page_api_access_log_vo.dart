// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'api_access_log_vo.dart';
import 'order_item.dart';
import 'page_api_access_log_vo.dart';

part 'page_api_access_log_vo.g.dart';

/// 数据
@JsonSerializable()
class PageApiAccessLogVo {
  const PageApiAccessLogVo({
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
  
  factory PageApiAccessLogVo.fromJson(Map<String, Object?> json) => _$PageApiAccessLogVoFromJson(json);
  
  final List<ApiAccessLogVo>? records;
  final int? total;
  final int? size;
  final int? current;
  final List<OrderItem>? orders;
  final PageApiAccessLogVo? optimizeCountSql;
  final PageApiAccessLogVo? searchCount;
  final bool? optimizeJoinOfCountSql;
  final int? maxLimit;
  final String? countId;
  final int? pages;

  Map<String, Object?> toJson() => _$PageApiAccessLogVoToJson(this);
}

// Flutter compute serialization functions for PageApiAccessLogVo
FutureOr<PageApiAccessLogVo> deserializePageApiAccessLogVo(Map<String, dynamic> json) =>
    PageApiAccessLogVo.fromJson(json);

FutureOr<List<PageApiAccessLogVo>> deserializePageApiAccessLogVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => PageApiAccessLogVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializePageApiAccessLogVo(PageApiAccessLogVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializePageApiAccessLogVoList(List<PageApiAccessLogVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
