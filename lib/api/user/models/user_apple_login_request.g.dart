// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_apple_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAppleLoginRequest _$UserAppleLoginRequestFromJson(Map json) =>
    $checkedCreate('UserAppleLoginRequest', json, ($checkedConvert) {
      final val = UserAppleLoginRequest(
        identityToken: $checkedConvert('identityToken', (v) => v as String),
        userIdentifier: $checkedConvert('userIdentifier', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$UserAppleLoginRequestToJson(
  UserAppleLoginRequest instance,
) => <String, dynamic>{
  'identityToken': instance.identityToken,
  'userIdentifier': instance.userIdentifier,
};
