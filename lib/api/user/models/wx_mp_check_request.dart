// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'wx_mp_check_request.g.dart';

/// 微信公众号校验请求
@JsonSerializable()
class WxMpCheckRequest {
  const WxMpCheckRequest({
    this.timestamp,
    this.nonce,
    this.signature,
    this.echostr,
  });
  
  factory WxMpCheckRequest.fromJson(Map<String, Object?> json) => _$WxMpCheckRequestFromJson(json);
  
  /// 时间戳
  final String? timestamp;

  /// 随机数
  final String? nonce;

  /// 签名
  final String? signature;

  /// 随机字符串
  final String? echostr;

  Map<String, Object?> toJson() => _$WxMpCheckRequestToJson(this);
}
