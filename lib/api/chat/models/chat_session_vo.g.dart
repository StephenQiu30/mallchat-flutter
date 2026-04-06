// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_session_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatSessionVo _$ChatSessionVoFromJson(Map<String, dynamic> json) =>
    ChatSessionVo(
      roomId: (json['roomId'] as num?)?.toInt(),
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      type: (json['type'] as num?)?.toInt(),
      lastMessage: json['lastMessage'] as String?,
      unreadCount: (json['unreadCount'] as num?)?.toInt(),
      topStatus: (json['topStatus'] as num?)?.toInt(),
      activeTime: json['activeTime'] == null
          ? null
          : DateTime.parse(json['activeTime'] as String),
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
