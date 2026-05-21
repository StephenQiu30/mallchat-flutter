// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'ai_operation_result_vo.g.dart';

/// AI操作结果
@JsonSerializable()
class AiOperationResultVo {
  const AiOperationResultVo({this.success});

  factory AiOperationResultVo.fromJson(Map<String, Object?> json) =>
      _$AiOperationResultVoFromJson(json);

  /// 是否成功
  final bool? success;

  Map<String, Object?> toJson() => _$AiOperationResultVoToJson(this);
}

// Flutter compute serialization functions for AiOperationResultVo
FutureOr<AiOperationResultVo> deserializeAiOperationResultVo(
  Map<String, dynamic> json,
) => AiOperationResultVo.fromJson(json);

FutureOr<List<AiOperationResultVo>> deserializeAiOperationResultVoList(
  List<Map<String, dynamic>> json,
) => json.map((e) => AiOperationResultVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeAiOperationResultVo(
  AiOperationResultVo? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeAiOperationResultVoList(
  List<AiOperationResultVo>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
