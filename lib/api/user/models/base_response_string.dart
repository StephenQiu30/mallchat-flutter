// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'base_response_string.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseString {
  const BaseResponseString({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponseString.fromJson(Map<String, Object?> json) => _$BaseResponseStringFromJson(json);
  
  /// 状态码
  final int? code;

  /// 数据
  final String? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseStringToJson(this);
}
