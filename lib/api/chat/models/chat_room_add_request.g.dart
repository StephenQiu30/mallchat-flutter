// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_add_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomAddRequest _$ChatRoomAddRequestFromJson(Map json) =>
    $checkedCreate('ChatRoomAddRequest', json, ($checkedConvert) {
      final val = ChatRoomAddRequest(
        name: $checkedConvert('name', (v) => v as String),
        type: $checkedConvert('type', (v) => (v as num).toInt()),
        avatar: $checkedConvert('avatar', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ChatRoomAddRequestToJson(ChatRoomAddRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'avatar': instance.avatar,
    };
