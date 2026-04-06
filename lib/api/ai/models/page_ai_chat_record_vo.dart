// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'ai_chat_record_vo.dart';
import 'order_item.dart';
import 'page_ai_chat_record_vo.dart';

part 'page_ai_chat_record_vo.g.dart';

/// 数据
@JsonSerializable()
class PageAiChatRecordVo {
  const PageAiChatRecordVo({
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
  
  factory PageAiChatRecordVo.fromJson(Map<String, Object?> json) => _$PageAiChatRecordVoFromJson(json);
  
  final List<AiChatRecordVo>? records;
  final int? total;
  final int? size;
  final int? current;
  final List<OrderItem>? orders;
  final PageAiChatRecordVo? optimizeCountSql;
  final PageAiChatRecordVo? searchCount;
  final bool? optimizeJoinOfCountSql;
  final int? maxLimit;
  final String? countId;
  final int? pages;

  Map<String, Object?> toJson() => _$PageAiChatRecordVoToJson(this);
}
