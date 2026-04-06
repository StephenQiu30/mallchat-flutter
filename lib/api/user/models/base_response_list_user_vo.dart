// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'user_vo.dart';

part 'base_response_list_user_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseListUserVo {
  const BaseResponseListUserVo({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponseListUserVo.fromJson(Map<String, Object?> json) => _$BaseResponseListUserVoFromJson(json);
  
  /// 状态码
  final int? code;

  /// 数据
  final List<UserVo>? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseListUserVoToJson(this);
}
