// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'ai_chat_record_query_request.g.dart';

/// AI 对话记录查询请求
@JsonSerializable()
class AiChatRecordQueryRequest {
  const AiChatRecordQueryRequest({
    this.current,
    this.pageSize,
    this.sortField,
    this.sortOrder,
    this.sessionId,
    this.modelType,
    this.searchText,
  });
  
  factory AiChatRecordQueryRequest.fromJson(Map<String, Object?> json) => _$AiChatRecordQueryRequestFromJson(json);
  
  /// 当前页号
  final int? current;

  /// 页面大小
  final int? pageSize;

  /// 排序字段
  final String? sortField;

  /// 排序顺序（默认升序）
  final String? sortOrder;

  /// 会话 id
  final String? sessionId;

  /// 模型类型
  final String? modelType;

  /// 搜索词 (匹配消息内容或响应)
  final String? searchText;

  Map<String, Object?> toJson() => _$AiChatRecordQueryRequestToJson(this);
}
