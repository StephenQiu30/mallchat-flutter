// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'ai_chat_response.g.dart';

/// AI 对话响应
@JsonSerializable()
class AiChatResponse {
  const AiChatResponse({
    this.content,
    this.totalTokens,
    this.promptTokens,
    this.completionTokens,
  });
  
  factory AiChatResponse.fromJson(Map<String, Object?> json) => _$AiChatResponseFromJson(json);
  
  /// AI 回答的结果文本
  final String? content;

  /// 总消耗 token
  final int? totalTokens;

  /// 提示消耗 token
  final int? promptTokens;

  /// 生成消耗 token
  final int? completionTokens;

  Map<String, Object?> toJson() => _$AiChatResponseToJson(this);
}

// Flutter compute serialization functions for AiChatResponse
FutureOr<AiChatResponse> deserializeAiChatResponse(Map<String, dynamic> json) =>
    AiChatResponse.fromJson(json);

FutureOr<List<AiChatResponse>> deserializeAiChatResponseList(List<Map<String, dynamic>> json) =>
    json.map((e) => AiChatResponse.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeAiChatResponse(AiChatResponse? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeAiChatResponseList(List<AiChatResponse>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
