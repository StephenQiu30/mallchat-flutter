// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map json) =>
    $checkedCreate('User', json, ($checkedConvert) {
      final val = User(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        userName: $checkedConvert('userName', (v) => v as String?),
        userAvatar: $checkedConvert('userAvatar', (v) => v as String?),
        userProfile: $checkedConvert('userProfile', (v) => v as String?),
        userRole: $checkedConvert('userRole', (v) => v as String?),
        userPhone: $checkedConvert('userPhone', (v) => v as String?),
        userEmail: $checkedConvert('userEmail', (v) => v as String?),
        maOpenId: $checkedConvert('maOpenId', (v) => v as String?),
        wxUnionId: $checkedConvert('wxUnionId', (v) => v as String?),
        wxOpenId: $checkedConvert('wxOpenId', (v) => v as String?),
        appleId: $checkedConvert('appleId', (v) => v as String?),
        lastLoginTime: $checkedConvert(
          'lastLoginTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        lastLoginIp: $checkedConvert('lastLoginIp', (v) => v as String?),
        createTime: $checkedConvert(
          'createTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        updateTime: $checkedConvert(
          'updateTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        isDelete: $checkedConvert('isDelete', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'userName': instance.userName,
  'userAvatar': instance.userAvatar,
  'userProfile': instance.userProfile,
  'userRole': instance.userRole,
  'userPhone': instance.userPhone,
  'userEmail': instance.userEmail,
  'maOpenId': instance.maOpenId,
  'wxUnionId': instance.wxUnionId,
  'wxOpenId': instance.wxOpenId,
  'appleId': instance.appleId,
  'lastLoginTime': instance.lastLoginTime?.toIso8601String(),
  'lastLoginIp': instance.lastLoginIp,
  'createTime': instance.createTime?.toIso8601String(),
  'updateTime': instance.updateTime?.toIso8601String(),
  'isDelete': instance.isDelete,
};
