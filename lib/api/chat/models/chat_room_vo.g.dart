// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomVo _$ChatRoomVoFromJson(Map json) =>
    $checkedCreate('ChatRoomVo', json, ($checkedConvert) {
      final val = ChatRoomVo(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        name: $checkedConvert('name', (v) => v as String?),
        type: $checkedConvert('type', (v) => (v as num?)?.toInt()),
        avatar: $checkedConvert('avatar', (v) => v as String?),
        createTime: $checkedConvert(
          'createTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ChatRoomVoToJson(ChatRoomVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'avatar': instance.avatar,
      'createTime': instance.createTime?.toIso8601String(),
    };
