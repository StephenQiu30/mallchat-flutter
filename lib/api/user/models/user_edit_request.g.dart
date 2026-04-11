// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_edit_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEditRequest _$UserEditRequestFromJson(Map json) =>
    $checkedCreate('UserEditRequest', json, ($checkedConvert) {
      final val = UserEditRequest(
        userName: $checkedConvert('userName', (v) => v as String?),
        userAvatar: $checkedConvert('userAvatar', (v) => v as String?),
        userProfile: $checkedConvert('userProfile', (v) => v as String?),
        userPhone: $checkedConvert('userPhone', (v) => v as String?),
        userEmail: $checkedConvert('userEmail', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$UserEditRequestToJson(UserEditRequest instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userAvatar': instance.userAvatar,
      'userProfile': instance.userProfile,
      'userPhone': instance.userPhone,
      'userEmail': instance.userEmail,
    };
