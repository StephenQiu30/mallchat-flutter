// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'ai_model_vo.dart';

part 'base_response_list_ai_model_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseListAiModelVo {
  const BaseResponseListAiModelVo({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponseListAiModelVo.fromJson(Map<String, Object?> json) => _$BaseResponseListAiModelVoFromJson(json);
  
  /// 状态码
  final int? code;

  /// 数据
  final List<AiModelVo>? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseListAiModelVoToJson(this);
}
