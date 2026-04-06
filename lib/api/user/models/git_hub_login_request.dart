// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'git_hub_login_request.g.dart';

/// GitHub 登录请求
@JsonSerializable()
class GitHubLoginRequest {
  const GitHubLoginRequest({
    this.code,
    this.state,
  });
  
  factory GitHubLoginRequest.fromJson(Map<String, Object?> json) => _$GitHubLoginRequestFromJson(json);
  
  /// 授权码
  final String? code;

  /// 防CSRF攻击的随机字符串
  final String? state;

  Map<String, Object?> toJson() => _$GitHubLoginRequestToJson(this);
}
