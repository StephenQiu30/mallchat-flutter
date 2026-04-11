// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'chat_session_vo.dart';

part 'base_response_list_chat_session_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseListChatSessionVo {
  const BaseResponseListChatSessionVo({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponseListChatSessionVo.fromJson(Map<String, Object?> json) => _$BaseResponseListChatSessionVoFromJson(json);
  
  /// 状态码
  final int? code;

  /// 数据
  final List<ChatSessionVo>? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseListChatSessionVoToJson(this);
}

// Flutter compute serialization functions for BaseResponseListChatSessionVo
FutureOr<BaseResponseListChatSessionVo> deserializeBaseResponseListChatSessionVo(Map<String, dynamic> json) =>
    BaseResponseListChatSessionVo.fromJson(json);

FutureOr<List<BaseResponseListChatSessionVo>> deserializeBaseResponseListChatSessionVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => BaseResponseListChatSessionVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponseListChatSessionVo(BaseResponseListChatSessionVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponseListChatSessionVoList(List<BaseResponseListChatSessionVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
