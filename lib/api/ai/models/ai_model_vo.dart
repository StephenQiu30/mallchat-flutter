// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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
