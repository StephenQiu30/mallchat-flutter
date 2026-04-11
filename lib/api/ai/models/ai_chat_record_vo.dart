// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'ai_chat_record_vo.g.dart';

/// AI 对话记录视图对象
@JsonSerializable()
class AiChatRecordVo {
  const AiChatRecordVo({
    this.id,
    this.userId,
    this.sessionId,
    this.message,
    this.response,
    this.modelType,
    this.createTime,
    this.updateTime,
  });
  
  factory AiChatRecordVo.fromJson(Map<String, Object?> json) => _$AiChatRecordVoFromJson(json);
  
  /// 主键
  final int? id;

  /// 用户 id
  final int? userId;

  /// 会话 id
  final String? sessionId;

  /// 对话消息
  final String? message;

  /// AI 响应内容
  final String? response;

  /// 模型类型
  final String? modelType;

  /// 创建时间
  final DateTime? createTime;

  /// 更新时间
  final DateTime? updateTime;

  Map<String, Object?> toJson() => _$AiChatRecordVoToJson(this);
}

// Flutter compute serialization functions for AiChatRecordVo
FutureOr<AiChatRecordVo> deserializeAiChatRecordVo(Map<String, dynamic> json) =>
    AiChatRecordVo.fromJson(json);

FutureOr<List<AiChatRecordVo>> deserializeAiChatRecordVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => AiChatRecordVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeAiChatRecordVo(AiChatRecordVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeAiChatRecordVoList(List<AiChatRecordVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
