// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'page_user_login_log_vo.dart';

part 'base_response_page_user_login_log_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponsePageUserLoginLogVo {
  const BaseResponsePageUserLoginLogVo({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponsePageUserLoginLogVo.fromJson(Map<String, Object?> json) => _$BaseResponsePageUserLoginLogVoFromJson(json);
  
  /// 状态码
  final int? code;
  final PageUserLoginLogVo? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponsePageUserLoginLogVoToJson(this);
}
