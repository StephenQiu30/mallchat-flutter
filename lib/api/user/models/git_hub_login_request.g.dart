// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'git_hub_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitHubLoginRequest _$GitHubLoginRequestFromJson(Map<String, dynamic> json) =>
    GitHubLoginRequest(
      code: json['code'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$GitHubLoginRequestToJson(GitHubLoginRequest instance) =>
    <String, dynamic>{'code': instance.code, 'state': instance.state};
