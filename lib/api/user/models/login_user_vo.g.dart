// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUserVo _$LoginUserVoFromJson(Map json) =>
    $checkedCreate('LoginUserVo', json, ($checkedConvert) {
      final val = LoginUserVo(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        userName: $checkedConvert('userName', (v) => v as String?),
        userAvatar: $checkedConvert('userAvatar', (v) => v as String?),
        userRole: $checkedConvert('userRole', (v) => v as String?),
        userProfile: $checkedConvert('userProfile', (v) => v as String?),
        userPhone: $checkedConvert('userPhone', (v) => v as String?),
        userEmail: $checkedConvert('userEmail', (v) => v as String?),
        lastLoginTime: $checkedConvert(
          'lastLoginTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        createTime: $checkedConvert(
          'createTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        updateTime: $checkedConvert(
          'updateTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        token: $checkedConvert('token', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$LoginUserVoToJson(LoginUserVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userAvatar': instance.userAvatar,
      'userRole': instance.userRole,
      'userProfile': instance.userProfile,
      'userPhone': instance.userPhone,
      'userEmail': instance.userEmail,
      'lastLoginTime': instance.lastLoginTime?.toIso8601String(),
      'createTime': instance.createTime?.toIso8601String(),
      'updateTime': instance.updateTime?.toIso8601String(),
      'token': instance.token,
    };
