// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_chat_friend_user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseListChatFriendUserVo _$BaseResponseListChatFriendUserVoFromJson(
  Map<String, dynamic> json,
) => BaseResponseListChatFriendUserVo(
  code: (json['code'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ChatFriendUserVo.fromJson(e as Map<String, dynamic>))
      .toList(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponseListChatFriendUserVoToJson(
  BaseResponseListChatFriendUserVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
