// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUpdateRequest _$UserUpdateRequestFromJson(Map json) =>
    $checkedCreate('UserUpdateRequest', json, ($checkedConvert) {
      final val = UserUpdateRequest(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        userName: $checkedConvert('userName', (v) => v as String?),
        userAvatar: $checkedConvert('userAvatar', (v) => v as String?),
        userProfile: $checkedConvert('userProfile', (v) => v as String?),
        userRole: $checkedConvert('userRole', (v) => v as String?),
        userPhone: $checkedConvert('userPhone', (v) => v as String?),
        userEmail: $checkedConvert('userEmail', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$UserUpdateRequestToJson(UserUpdateRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userAvatar': instance.userAvatar,
      'userProfile': instance.userProfile,
      'userRole': instance.userRole,
      'userPhone': instance.userPhone,
      'userEmail': instance.userEmail,
    };
