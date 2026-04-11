// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_email_code_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEmailCodeRequest _$UserEmailCodeRequestFromJson(Map json) =>
    $checkedCreate('UserEmailCodeRequest', json, ($checkedConvert) {
      final val = UserEmailCodeRequest(
        email: $checkedConvert('email', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$UserEmailCodeRequestToJson(
  UserEmailCodeRequest instance,
) => <String, dynamic>{'email': instance.email};
