// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'chat_message_vo.dart';

part 'base_response_list_chat_message_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseListChatMessageVo {
  const BaseResponseListChatMessageVo({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponseListChatMessageVo.fromJson(Map<String, Object?> json) => _$BaseResponseListChatMessageVoFromJson(json);
  
  /// 状态码
  final int? code;

  /// 数据
  final List<ChatMessageVo>? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseListChatMessageVoToJson(this);
}

// Flutter compute serialization functions for BaseResponseListChatMessageVo
FutureOr<BaseResponseListChatMessageVo> deserializeBaseResponseListChatMessageVo(Map<String, dynamic> json) =>
    BaseResponseListChatMessageVo.fromJson(json);

FutureOr<List<BaseResponseListChatMessageVo>> deserializeBaseResponseListChatMessageVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => BaseResponseListChatMessageVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponseListChatMessageVo(BaseResponseListChatMessageVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponseListChatMessageVoList(List<BaseResponseListChatMessageVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
