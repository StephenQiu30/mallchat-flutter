// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'file_upload_record_vo.dart';
import 'order_item.dart';
import 'page_file_upload_record_vo.dart';

part 'page_file_upload_record_vo.g.dart';

/// 数据
@JsonSerializable()
class PageFileUploadRecordVo {
  const PageFileUploadRecordVo({
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
  
  factory PageFileUploadRecordVo.fromJson(Map<String, Object?> json) => _$PageFileUploadRecordVoFromJson(json);
  
  final List<FileUploadRecordVo>? records;
  final int? total;
  final int? size;
  final int? current;
  final List<OrderItem>? orders;
  final PageFileUploadRecordVo? optimizeCountSql;
  final PageFileUploadRecordVo? searchCount;
  final bool? optimizeJoinOfCountSql;
  final int? maxLimit;
  final String? countId;
  final int? pages;

  Map<String, Object?> toJson() => _$PageFileUploadRecordVoToJson(this);
}

// Flutter compute serialization functions for PageFileUploadRecordVo
FutureOr<PageFileUploadRecordVo> deserializePageFileUploadRecordVo(Map<String, dynamic> json) =>
    PageFileUploadRecordVo.fromJson(json);

FutureOr<List<PageFileUploadRecordVo>> deserializePageFileUploadRecordVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => PageFileUploadRecordVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializePageFileUploadRecordVo(PageFileUploadRecordVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializePageFileUploadRecordVoList(List<PageFileUploadRecordVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
