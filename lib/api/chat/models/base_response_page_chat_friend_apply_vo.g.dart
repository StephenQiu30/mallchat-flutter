// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_chat_friend_apply_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageChatFriendApplyVo _$BaseResponsePageChatFriendApplyVoFromJson(
  Map<String, dynamic> json,
) => BaseResponsePageChatFriendApplyVo(
  code: (json['code'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : PageChatFriendApplyVo.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponsePageChatFriendApplyVoToJson(
  BaseResponsePageChatFriendApplyVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
