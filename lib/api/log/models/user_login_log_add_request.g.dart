// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_log_add_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginLogAddRequest _$UserLoginLogAddRequestFromJson(
  Map<String, dynamic> json,
) => UserLoginLogAddRequest(
  userId: (json['userId'] as num?)?.toInt(),
  account: json['account'] as String?,
  loginType: json['loginType'] as String?,
  status: json['status'] as String?,
  failReason: json['failReason'] as String?,
  clientIp: json['clientIp'] as String?,
  location: json['location'] as String?,
  userAgent: json['userAgent'] as String?,
);

Map<String, dynamic> _$UserLoginLogAddRequestToJson(
  UserLoginLogAddRequest instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'account': instance.account,
  'loginType': instance.loginType,
  'status': instance.status,
  'failReason': instance.failReason,
  'clientIp': instance.clientIp,
  'location': instance.location,
  'userAgent': instance.userAgent,
};
