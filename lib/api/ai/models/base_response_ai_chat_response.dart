// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

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

// Flutter compute serialization functions for BaseResponseAiChatResponse
FutureOr<BaseResponseAiChatResponse> deserializeBaseResponseAiChatResponse(Map<String, dynamic> json) =>
    BaseResponseAiChatResponse.fromJson(json);

FutureOr<List<BaseResponseAiChatResponse>> deserializeBaseResponseAiChatResponseList(List<Map<String, dynamic>> json) =>
    json.map((e) => BaseResponseAiChatResponse.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponseAiChatResponse(BaseResponseAiChatResponse? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponseAiChatResponseList(List<BaseResponseAiChatResponse>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
