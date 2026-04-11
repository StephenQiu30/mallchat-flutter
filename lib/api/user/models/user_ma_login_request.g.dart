// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ma_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMaLoginRequest _$UserMaLoginRequestFromJson(Map json) =>
    $checkedCreate('UserMaLoginRequest', json, ($checkedConvert) {
      final val = UserMaLoginRequest(
        code: $checkedConvert('code', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$UserMaLoginRequestToJson(UserMaLoginRequest instance) =>
    <String, dynamic>{'code': instance.code};
