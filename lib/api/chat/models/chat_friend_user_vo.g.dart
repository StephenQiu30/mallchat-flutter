// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_friend_user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatFriendUserVo _$ChatFriendUserVoFromJson(Map json) =>
    $checkedCreate('ChatFriendUserVo', json, ($checkedConvert) {
      final val = ChatFriendUserVo(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        userName: $checkedConvert('userName', (v) => v as String?),
        userAvatar: $checkedConvert('userAvatar', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ChatFriendUserVoToJson(ChatFriendUserVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userAvatar': instance.userAvatar,
    };
