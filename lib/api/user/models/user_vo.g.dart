// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserVo _$UserVoFromJson(Map<String, dynamic> json) => UserVo(
  id: (json['id'] as num?)?.toInt(),
  userName: json['userName'] as String?,
  userAvatar: json['userAvatar'] as String?,
  userProfile: json['userProfile'] as String?,
  userRole: json['userRole'] as String?,
  userPhone: json['userPhone'] as String?,
  githubLogin: json['githubLogin'] as String?,
  githubUrl: json['githubUrl'] as String?,
  createTime: json['createTime'] == null
      ? null
      : DateTime.parse(json['createTime'] as String),
  updateTime: json['updateTime'] == null
      ? null
      : DateTime.parse(json['updateTime'] as String),
);

Map<String, dynamic> _$UserVoToJson(UserVo instance) => <String, dynamic>{
  'id': instance.id,
  'userName': instance.userName,
  'userAvatar': instance.userAvatar,
  'userProfile': instance.userProfile,
  'userRole': instance.userRole,
  'userPhone': instance.userPhone,
  'githubLogin': instance.githubLogin,
  'githubUrl': instance.githubUrl,
  'createTime': instance.createTime?.toIso8601String(),
  'updateTime': instance.updateTime?.toIso8601String(),
};
