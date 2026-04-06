// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_log_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginLogVo _$UserLoginLogVoFromJson(Map<String, dynamic> json) =>
    UserLoginLogVo(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      account: json['account'] as String?,
      loginType: json['loginType'] as String?,
      status: json['status'] as String?,
      failReason: json['failReason'] as String?,
      clientIp: json['clientIp'] as String?,
      location: json['location'] as String?,
      userAgent: json['userAgent'] as String?,
      createTime: json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
    );

Map<String, dynamic> _$UserLoginLogVoToJson(UserLoginLogVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'account': instance.account,
      'loginType': instance.loginType,
      'status': instance.status,
      'failReason': instance.failReason,
      'clientIp': instance.clientIp,
      'location': instance.location,
      'userAgent': instance.userAgent,
      'createTime': instance.createTime?.toIso8601String(),
    };
