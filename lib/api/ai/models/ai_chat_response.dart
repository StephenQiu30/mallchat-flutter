// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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
