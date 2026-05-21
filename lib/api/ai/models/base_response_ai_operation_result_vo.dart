// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'ai_operation_result_vo.dart';

part 'base_response_ai_operation_result_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseAiOperationResultVo {
  const BaseResponseAiOperationResultVo({this.code, this.data, this.message});

  factory BaseResponseAiOperationResultVo.fromJson(Map<String, Object?> json) =>
      _$BaseResponseAiOperationResultVoFromJson(json);

  /// 状态码
  final int? code;
  final AiOperationResultVo? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() =>
      _$BaseResponseAiOperationResultVoToJson(this);
}

// Flutter compute serialization functions for BaseResponseAiOperationResultVo
FutureOr<BaseResponseAiOperationResultVo>
deserializeBaseResponseAiOperationResultVo(Map<String, dynamic> json) =>
    BaseResponseAiOperationResultVo.fromJson(json);

FutureOr<List<BaseResponseAiOperationResultVo>>
deserializeBaseResponseAiOperationResultVoList(
  List<Map<String, dynamic>> json,
) => json.map((e) => BaseResponseAiOperationResultVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponseAiOperationResultVo(
  BaseResponseAiOperationResultVo? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>>
serializeBaseResponseAiOperationResultVoList(
  List<BaseResponseAiOperationResultVo>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
