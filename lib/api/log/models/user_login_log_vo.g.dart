// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_log_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginLogVo _$UserLoginLogVoFromJson(Map json) =>
    $checkedCreate('UserLoginLogVo', json, ($checkedConvert) {
      final val = UserLoginLogVo(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        userId: $checkedConvert('userId', (v) => (v as num?)?.toInt()),
        account: $checkedConvert('account', (v) => v as String?),
        loginType: $checkedConvert('loginType', (v) => v as String?),
        status: $checkedConvert('status', (v) => v as String?),
        failReason: $checkedConvert('failReason', (v) => v as String?),
        clientIp: $checkedConvert('clientIp', (v) => v as String?),
        location: $checkedConvert('location', (v) => v as String?),
        userAgent: $checkedConvert('userAgent', (v) => v as String?),
        createTime: $checkedConvert(
          'createTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

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
