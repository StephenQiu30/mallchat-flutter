// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'operation_log_vo.dart';
import 'order_item.dart';
import 'page_operation_log_vo.dart';

part 'page_operation_log_vo.g.dart';

/// 数据
@JsonSerializable()
class PageOperationLogVo {
  const PageOperationLogVo({
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
  
  factory PageOperationLogVo.fromJson(Map<String, Object?> json) => _$PageOperationLogVoFromJson(json);
  
  final List<OperationLogVo>? records;
  final int? total;
  final int? size;
  final int? current;
  final List<OrderItem>? orders;
  final PageOperationLogVo? optimizeCountSql;
  final PageOperationLogVo? searchCount;
  final bool? optimizeJoinOfCountSql;
  final int? maxLimit;
  final String? countId;
  final int? pages;

  Map<String, Object?> toJson() => _$PageOperationLogVoToJson(this);
}
