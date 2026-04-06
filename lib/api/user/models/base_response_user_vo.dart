// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'user_vo.dart';

part 'base_response_user_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseUserVo {
  const BaseResponseUserVo({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponseUserVo.fromJson(Map<String, Object?> json) => _$BaseResponseUserVoFromJson(json);
  
  /// 状态码
  final int? code;
  final UserVo? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseUserVoToJson(this);
}
