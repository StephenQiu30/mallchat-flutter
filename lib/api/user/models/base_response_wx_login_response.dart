// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'wx_login_response.dart';

part 'base_response_wx_login_response.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseWxLoginResponse {
  const BaseResponseWxLoginResponse({
    this.code,
    this.data,
    this.message,
  });
  
  factory BaseResponseWxLoginResponse.fromJson(Map<String, Object?> json) => _$BaseResponseWxLoginResponseFromJson(json);
  
  /// 状态码
  final int? code;
  final WxLoginResponse? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseWxLoginResponseToJson(this);
}
