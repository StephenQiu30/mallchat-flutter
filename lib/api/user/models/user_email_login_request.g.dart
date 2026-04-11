// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_email_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEmailLoginRequest _$UserEmailLoginRequestFromJson(Map json) =>
    $checkedCreate('UserEmailLoginRequest', json, ($checkedConvert) {
      final val = UserEmailLoginRequest(
        email: $checkedConvert('email', (v) => v as String?),
        code: $checkedConvert('code', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$UserEmailLoginRequestToJson(
  UserEmailLoginRequest instance,
) => <String, dynamic>{'email': instance.email, 'code': instance.code};
