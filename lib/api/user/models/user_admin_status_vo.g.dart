// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_admin_status_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAdminStatusVo _$UserAdminStatusVoFromJson(Map json) =>
    $checkedCreate('UserAdminStatusVo', json, ($checkedConvert) {
      final val = UserAdminStatusVo(
        admin: $checkedConvert('admin', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$UserAdminStatusVoToJson(UserAdminStatusVo instance) =>
    <String, dynamic>{'admin': instance.admin};
