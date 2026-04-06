// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomVo _$ChatRoomVoFromJson(Map<String, dynamic> json) => ChatRoomVo(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  type: (json['type'] as num?)?.toInt(),
  avatar: json['avatar'] as String?,
  createTime: json['createTime'] == null
      ? null
      : DateTime.parse(json['createTime'] as String),
);

Map<String, dynamic> _$ChatRoomVoToJson(ChatRoomVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'avatar': instance.avatar,
      'createTime': instance.createTime?.toIso8601String(),
    };
