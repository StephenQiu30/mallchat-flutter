// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_session_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatSessionVo _$ChatSessionVoFromJson(Map json) => $checkedCreate(
  'ChatSessionVo',
  json,
  ($checkedConvert) {
    final val = ChatSessionVo(
      roomId: $checkedConvert('roomId', (v) => (v as num?)?.toInt()),
      name: $checkedConvert('name', (v) => v as String?),
      avatar: $checkedConvert('avatar', (v) => v as String?),
      type: $checkedConvert('type', (v) => (v as num?)?.toInt()),
      lastMessage: $checkedConvert('lastMessage', (v) => v as String?),
      unreadCount: $checkedConvert('unreadCount', (v) => (v as num?)?.toInt()),
      topStatus: $checkedConvert('topStatus', (v) => (v as num?)?.toInt()),
      activeTime: $checkedConvert(
        'activeTime',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$ChatSessionVoToJson(ChatSessionVo instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'name': instance.name,
      'avatar': instance.avatar,
      'type': instance.type,
      'lastMessage': instance.lastMessage,
      'unreadCount': instance.unreadCount,
      'topStatus': instance.topStatus,
      'activeTime': instance.activeTime?.toIso8601String(),
    };
