// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_friend_user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatFriendUserVo _$ChatFriendUserVoFromJson(Map<String, dynamic> json) =>
    ChatFriendUserVo(
      id: (json['id'] as num?)?.toInt(),
      userName: json['userName'] as String?,
      userAvatar: json['userAvatar'] as String?,
    );

Map<String, dynamic> _$ChatFriendUserVoToJson(ChatFriendUserVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userAvatar': instance.userAvatar,
    };
