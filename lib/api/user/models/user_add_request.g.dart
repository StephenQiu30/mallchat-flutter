// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_add_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddRequest _$UserAddRequestFromJson(Map json) =>
    $checkedCreate('UserAddRequest', json, ($checkedConvert) {
      final val = UserAddRequest(
        userName: $checkedConvert('userName', (v) => v as String?),
        userAvatar: $checkedConvert('userAvatar', (v) => v as String?),
        userRole: $checkedConvert('userRole', (v) => v as String?),
        userEmail: $checkedConvert('userEmail', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$UserAddRequestToJson(UserAddRequest instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userAvatar': instance.userAvatar,
      'userRole': instance.userRole,
      'userEmail': instance.userEmail,
    };
