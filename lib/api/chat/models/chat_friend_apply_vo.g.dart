// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_friend_apply_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatFriendApplyVo _$ChatFriendApplyVoFromJson(Map json) =>
    $checkedCreate('ChatFriendApplyVo', json, ($checkedConvert) {
      final val = ChatFriendApplyVo(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        userId: $checkedConvert('userId', (v) => (v as num?)?.toInt()),
        userName: $checkedConvert('userName', (v) => v as String?),
        userAvatar: $checkedConvert('userAvatar', (v) => v as String?),
        msg: $checkedConvert('msg', (v) => v as String?),
        status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
        createTime: $checkedConvert(
          'createTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

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
