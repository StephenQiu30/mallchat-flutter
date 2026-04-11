// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'login_user_vo.dart';

part 'base_response_login_user_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseLoginUserVo {
  const BaseResponseLoginUserVo({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponseLoginUserVo.fromJson(Map<String, Object?> json) => _$BaseResponseLoginUserVoFromJson(json);
  
  /// 状态码
  final int? code;
  final LoginUserVo? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseLoginUserVoToJson(this);
}

// Flutter compute serialization functions for BaseResponseLoginUserVo
FutureOr<BaseResponseLoginUserVo> deserializeBaseResponseLoginUserVo(Map<String, dynamic> json) =>
    BaseResponseLoginUserVo.fromJson(json);

FutureOr<List<BaseResponseLoginUserVo>> deserializeBaseResponseLoginUserVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => BaseResponseLoginUserVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponseLoginUserVo(BaseResponseLoginUserVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponseLoginUserVoList(List<BaseResponseLoginUserVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
