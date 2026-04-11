// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_app_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAppLoginRequest _$UserAppLoginRequestFromJson(Map json) =>
    $checkedCreate('UserAppLoginRequest', json, ($checkedConvert) {
      final val = UserAppLoginRequest(
        code: $checkedConvert('code', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$UserAppLoginRequestToJson(
  UserAppLoginRequest instance,
) => <String, dynamic>{'code': instance.code};
