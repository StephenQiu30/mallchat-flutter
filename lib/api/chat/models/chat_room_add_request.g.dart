// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_add_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomAddRequest _$ChatRoomAddRequestFromJson(Map<String, dynamic> json) =>
    ChatRoomAddRequest(
      name: json['name'] as String,
      type: (json['type'] as num).toInt(),
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$ChatRoomAddRequestToJson(ChatRoomAddRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'avatar': instance.avatar,
    };
