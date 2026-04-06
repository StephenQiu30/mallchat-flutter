// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'git_hub_callback_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitHubCallbackRequest _$GitHubCallbackRequestFromJson(
  Map<String, dynamic> json,
) => GitHubCallbackRequest(
  code: json['code'] as String,
  state: json['state'] as String,
);

Map<String, dynamic> _$GitHubCallbackRequestToJson(
  GitHubCallbackRequest instance,
) => <String, dynamic>{'code': instance.code, 'state': instance.state};
