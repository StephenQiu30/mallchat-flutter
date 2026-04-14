// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'page_ai_chat_record_vo.dart';

part 'base_response_page_ai_chat_record_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponsePageAiChatRecordVo {
  const BaseResponsePageAiChatRecordVo({this.code, this.data, this.message});

  factory BaseResponsePageAiChatRecordVo.fromJson(Map<String, Object?> json) =>
      _$BaseResponsePageAiChatRecordVoFromJson(json);

  /// 状态码
  final int? code;
  final PageAiChatRecordVo? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponsePageAiChatRecordVoToJson(this);
}

// Flutter compute serialization functions for BaseResponsePageAiChatRecordVo
FutureOr<BaseResponsePageAiChatRecordVo>
deserializeBaseResponsePageAiChatRecordVo(Map<String, dynamic> json) =>
    BaseResponsePageAiChatRecordVo.fromJson(json);

FutureOr<List<BaseResponsePageAiChatRecordVo>>
deserializeBaseResponsePageAiChatRecordVoList(
  List<Map<String, dynamic>> json,
) => json.map((e) => BaseResponsePageAiChatRecordVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponsePageAiChatRecordVo(
  BaseResponsePageAiChatRecordVo? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>>
serializeBaseResponsePageAiChatRecordVoList(
  List<BaseResponsePageAiChatRecordVo>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
