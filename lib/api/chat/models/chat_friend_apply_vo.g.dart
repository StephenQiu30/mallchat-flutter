// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_friend_apply_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatFriendApplyVo _$ChatFriendApplyVoFromJson(Map<String, dynamic> json) =>
    ChatFriendApplyVo(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      userName: json['userName'] as String?,
      userAvatar: json['userAvatar'] as String?,
      msg: json['msg'] as String?,
      status: (json['status'] as num?)?.toInt(),
      createTime: json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
    );

Map<String, dynamic> _$ChatFriendApplyVoToJson(ChatFriendApplyVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'userAvatar': instance.userAvatar,
      'msg': instance.msg,
      'status': instance.status,
      'createTime': instance.createTime?.toIso8601String(),
    };
