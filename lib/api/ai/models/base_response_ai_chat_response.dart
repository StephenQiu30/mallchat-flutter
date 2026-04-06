// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'ai_chat_response.dart';

part 'base_response_ai_chat_response.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseAiChatResponse {
  const BaseResponseAiChatResponse({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponseAiChatResponse.fromJson(Map<String, Object?> json) => _$BaseResponseAiChatResponseFromJson(json);
  
  /// 状态码
  final int? code;
  final AiChatResponse? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseAiChatResponseToJson(this);
}
