// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'order_item.dart';
import 'page_user_login_log_vo.dart';
import 'user_login_log_vo.dart';

part 'page_user_login_log_vo.g.dart';

/// 数据
@JsonSerializable()
class PageUserLoginLogVo {
  const PageUserLoginLogVo({
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

  factory PageUserLoginLogVo.fromJson(Map<String, Object?> json) =>
      _$PageUserLoginLogVoFromJson(json);

  final List<UserLoginLogVo>? records;
  final int? total;
  final int? size;
  final int? current;
  final List<OrderItem>? orders;
  final PageUserLoginLogVo? optimizeCountSql;
  final PageUserLoginLogVo? searchCount;
  final bool? optimizeJoinOfCountSql;
  final int? maxLimit;
  final String? countId;
  final int? pages;

  Map<String, Object?> toJson() => _$PageUserLoginLogVoToJson(this);
}

// Flutter compute serialization functions for PageUserLoginLogVo
FutureOr<PageUserLoginLogVo> deserializePageUserLoginLogVo(
  Map<String, dynamic> json,
) => PageUserLoginLogVo.fromJson(json);

FutureOr<List<PageUserLoginLogVo>> deserializePageUserLoginLogVoList(
  List<Map<String, dynamic>> json,
) => json.map((e) => PageUserLoginLogVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializePageUserLoginLogVo(
  PageUserLoginLogVo? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializePageUserLoginLogVoList(
  List<PageUserLoginLogVo>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
