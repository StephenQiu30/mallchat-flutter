// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_log_add_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginLogAddRequest _$UserLoginLogAddRequestFromJson(Map json) =>
    $checkedCreate('UserLoginLogAddRequest', json, ($checkedConvert) {
      final val = UserLoginLogAddRequest(
        userId: $checkedConvert('userId', (v) => (v as num?)?.toInt()),
        account: $checkedConvert('account', (v) => v as String?),
        loginType: $checkedConvert('loginType', (v) => v as String?),
        status: $checkedConvert('status', (v) => v as String?),
        failReason: $checkedConvert('failReason', (v) => v as String?),
        clientIp: $checkedConvert('clientIp', (v) => v as String?),
        location: $checkedConvert('location', (v) => v as String?),
        userAgent: $checkedConvert('userAgent', (v) => v as String?),
      );
      return val;
    });

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
