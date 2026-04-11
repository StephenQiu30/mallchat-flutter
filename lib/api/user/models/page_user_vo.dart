// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'order_item.dart';
import 'page_user_vo.dart';
import 'user_vo.dart';

part 'page_user_vo.g.dart';

/// 数据
@JsonSerializable()
class PageUserVo {
  const PageUserVo({
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
  
  factory PageUserVo.fromJson(Map<String, Object?> json) => _$PageUserVoFromJson(json);
  
  final List<UserVo>? records;
  final int? total;
  final int? size;
  final int? current;
  final List<OrderItem>? orders;
  final PageUserVo? optimizeCountSql;
  final PageUserVo? searchCount;
  final bool? optimizeJoinOfCountSql;
  final int? maxLimit;
  final String? countId;
  final int? pages;

  Map<String, Object?> toJson() => _$PageUserVoToJson(this);
}

// Flutter compute serialization functions for PageUserVo
FutureOr<PageUserVo> deserializePageUserVo(Map<String, dynamic> json) =>
    PageUserVo.fromJson(json);

FutureOr<List<PageUserVo>> deserializePageUserVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => PageUserVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializePageUserVo(PageUserVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializePageUserVoList(List<PageUserVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
