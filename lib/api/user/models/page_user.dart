// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'order_item.dart';
import 'page_user.dart';
import 'user.dart';

part 'page_user.g.dart';

/// 数据
@JsonSerializable()
class PageUser {
  const PageUser({
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
  
  factory PageUser.fromJson(Map<String, Object?> json) => _$PageUserFromJson(json);
  
  final List<User>? records;
  final int? total;
  final int? size;
  final int? current;
  final List<OrderItem>? orders;
  final PageUser? optimizeCountSql;
  final PageUser? searchCount;
  final bool? optimizeJoinOfCountSql;
  final int? maxLimit;
  final String? countId;
  final int? pages;

  Map<String, Object?> toJson() => _$PageUserToJson(this);
}

// Flutter compute serialization functions for PageUser
FutureOr<PageUser> deserializePageUser(Map<String, dynamic> json) =>
    PageUser.fromJson(json);

FutureOr<List<PageUser>> deserializePageUserList(List<Map<String, dynamic>> json) =>
    json.map((e) => PageUser.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializePageUser(PageUser? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializePageUserList(List<PageUser>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
