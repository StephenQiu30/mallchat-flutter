// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num?)?.toInt(),
  userName: json['userName'] as String?,
  userAvatar: json['userAvatar'] as String?,
  userProfile: json['userProfile'] as String?,
  userRole: json['userRole'] as String?,
  userPhone: json['userPhone'] as String?,
  mpOpenId: json['mpOpenId'] as String?,
  wxUnionId: json['wxUnionId'] as String?,
  wxOpenId: json['wxOpenId'] as String?,
  githubId: json['githubId'] as String?,
  githubLogin: json['githubLogin'] as String?,
  githubUrl: json['githubUrl'] as String?,
  lastLoginTime: json['lastLoginTime'] == null
      ? null
      : DateTime.parse(json['lastLoginTime'] as String),
  lastLoginIp: json['lastLoginIp'] as String?,
  createTime: json['createTime'] == null
      ? null
      : DateTime.parse(json['createTime'] as String),
  updateTime: json['updateTime'] == null
      ? null
      : DateTime.parse(json['updateTime'] as String),
  isDelete: (json['isDelete'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'userName': instance.userName,
  'userAvatar': instance.userAvatar,
  'userProfile': instance.userProfile,
  'userRole': instance.userRole,
  'userPhone': instance.userPhone,
  'mpOpenId': instance.mpOpenId,
  'wxUnionId': instance.wxUnionId,
  'wxOpenId': instance.wxOpenId,
  'githubId': instance.githubId,
  'githubLogin': instance.githubLogin,
  'githubUrl': instance.githubUrl,
  'lastLoginTime': instance.lastLoginTime?.toIso8601String(),
  'lastLoginIp': instance.lastLoginIp,
  'createTime': instance.createTime?.toIso8601String(),
  'updateTime': instance.updateTime?.toIso8601String(),
  'isDelete': instance.isDelete,
};
