// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'ai_chat_request.g.dart';

/// AI 对话请求
@JsonSerializable()
class AiChatRequest {
  const AiChatRequest({
    this.message,
    this.modelType,
    this.sessionId,
    this.systemMessage,
  });
  
  factory AiChatRequest.fromJson(Map<String, Object?> json) => _$AiChatRequestFromJson(json);
  
  /// 问题内容
  final String? message;

  /// 模型类型 (dashscope: 通义千问, ollama: 本地模型)
  final String? modelType;

  /// 会话 id
  final String? sessionId;

  /// 系统提示词 (用于定义 AI 角色)
  final String? systemMessage;

  Map<String, Object?> toJson() => _$AiChatRequestToJson(this);
}

// Flutter compute serialization functions for AiChatRequest
FutureOr<AiChatRequest> deserializeAiChatRequest(Map<String, dynamic> json) =>
    AiChatRequest.fromJson(json);

FutureOr<List<AiChatRequest>> deserializeAiChatRequestList(List<Map<String, dynamic>> json) =>
    json.map((e) => AiChatRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeAiChatRequest(AiChatRequest? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeAiChatRequestList(List<AiChatRequest>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
