// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserVo _$UserVoFromJson(Map json) =>
    $checkedCreate('UserVo', json, ($checkedConvert) {
      final val = UserVo(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        userName: $checkedConvert('userName', (v) => v as String?),
        userAvatar: $checkedConvert('userAvatar', (v) => v as String?),
        userProfile: $checkedConvert('userProfile', (v) => v as String?),
        userRole: $checkedConvert('userRole', (v) => v as String?),
        userPhone: $checkedConvert('userPhone', (v) => v as String?),
        userEmail: $checkedConvert('userEmail', (v) => v as String?),
        createTime: $checkedConvert(
          'createTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        updateTime: $checkedConvert(
          'updateTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UserVoToJson(UserVo instance) => <String, dynamic>{
  'id': instance.id,
  'userName': instance.userName,
  'userAvatar': instance.userAvatar,
  'userProfile': instance.userProfile,
  'userRole': instance.userRole,
  'userPhone': instance.userPhone,
  'userEmail': instance.userEmail,
  'createTime': instance.createTime?.toIso8601String(),
  'updateTime': instance.updateTime?.toIso8601String(),
};
