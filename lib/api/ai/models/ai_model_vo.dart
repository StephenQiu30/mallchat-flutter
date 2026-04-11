// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'ai_model_vo.g.dart';

/// AI 模型信息
@JsonSerializable()
class AiModelVo {
  const AiModelVo({
    this.name,
    this.description,
  });
  
  factory AiModelVo.fromJson(Map<String, Object?> json) => _$AiModelVoFromJson(json);
  
  /// 模型名称
  final String? name;

  /// 模型描述
  final String? description;

  Map<String, Object?> toJson() => _$AiModelVoToJson(this);
}

// Flutter compute serialization functions for AiModelVo
FutureOr<AiModelVo> deserializeAiModelVo(Map<String, dynamic> json) =>
    AiModelVo.fromJson(json);

FutureOr<List<AiModelVo>> deserializeAiModelVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => AiModelVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeAiModelVo(AiModelVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeAiModelVoList(List<AiModelVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
