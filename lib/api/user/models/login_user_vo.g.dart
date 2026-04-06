// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUserVo _$LoginUserVoFromJson(Map<String, dynamic> json) => LoginUserVo(
  id: (json['id'] as num?)?.toInt(),
  userName: json['userName'] as String?,
  userAvatar: json['userAvatar'] as String?,
  userRole: json['userRole'] as String?,
  userProfile: json['userProfile'] as String?,
  githubLogin: json['githubLogin'] as String?,
  githubUrl: json['githubUrl'] as String?,
  userPhone: json['userPhone'] as String?,
  lastLoginTime: json['lastLoginTime'] == null
      ? null
      : DateTime.parse(json['lastLoginTime'] as String),
  createTime: json['createTime'] == null
      ? null
      : DateTime.parse(json['createTime'] as String),
  updateTime: json['updateTime'] == null
      ? null
      : DateTime.parse(json['updateTime'] as String),
  token: json['token'] as String?,
);

Map<String, dynamic> _$LoginUserVoToJson(LoginUserVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userAvatar': instance.userAvatar,
      'userRole': instance.userRole,
      'userProfile': instance.userProfile,
      'githubLogin': instance.githubLogin,
      'githubUrl': instance.githubUrl,
      'userPhone': instance.userPhone,
      'lastLoginTime': instance.lastLoginTime?.toIso8601String(),
      'createTime': instance.createTime?.toIso8601String(),
      'updateTime': instance.updateTime?.toIso8601String(),
      'token': instance.token,
    };
