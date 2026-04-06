// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'file_upload_record_query_request.g.dart';

/// 文件上传记录查询请求
@JsonSerializable()
class FileUploadRecordQueryRequest {
  const FileUploadRecordQueryRequest({
    this.current,
    this.pageSize,
    this.sortField,
    this.sortOrder,
    this.id,
    this.userId,
    this.bizType,
    this.fileName,
    this.status,
    this.searchText,
  });
  
  factory FileUploadRecordQueryRequest.fromJson(Map<String, Object?> json) => _$FileUploadRecordQueryRequestFromJson(json);
  
  /// 当前页号
  final int? current;

  /// 页面大小
  final int? pageSize;

  /// 排序字段
  final String? sortField;

  /// 排序顺序（默认升序）
  final String? sortOrder;

  /// 主键
  final int? id;

  /// 用户ID
  final int? userId;

  /// 业务类型
  final String? bizType;

  /// 原始文件名
  final String? fileName;

  /// 上传状态
  final String? status;

  /// 搜索文本
  final String? searchText;

  Map<String, Object?> toJson() => _$FileUploadRecordQueryRequestToJson(this);
}
