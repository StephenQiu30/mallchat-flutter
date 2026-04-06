// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_chat_room_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseListChatRoomVo _$BaseResponseListChatRoomVoFromJson(
  Map<String, dynamic> json,
) => BaseResponseListChatRoomVo(
  code: (json['code'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ChatRoomVo.fromJson(e as Map<String, dynamic>))
      .toList(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponseListChatRoomVoToJson(
  BaseResponseListChatRoomVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
