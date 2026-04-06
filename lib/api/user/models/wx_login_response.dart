// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'wx_login_response.g.dart';

/// 微信扫码登录响应
@JsonSerializable()
class WxLoginResponse {
  const WxLoginResponse({
    this.qrCodeUrl,
    this.sceneId,
  });
  
  factory WxLoginResponse.fromJson(Map<String, Object?> json) => _$WxLoginResponseFromJson(json);
  
  /// 二维码 URL
  final String? qrCodeUrl;

  /// 场景 ID
  final String? sceneId;

  Map<String, Object?> toJson() => _$WxLoginResponseToJson(this);
}
