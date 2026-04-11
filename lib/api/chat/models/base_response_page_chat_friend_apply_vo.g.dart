// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_chat_friend_apply_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageChatFriendApplyVo _$BaseResponsePageChatFriendApplyVoFromJson(
  Map json,
) => $checkedCreate('BaseResponsePageChatFriendApplyVo', json, (
  $checkedConvert,
) {
  final val = BaseResponsePageChatFriendApplyVo(
    code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => v == null
          ? null
          : PageChatFriendApplyVo.fromJson(Map<String, Object?>.from(v as Map)),
    ),
    message: $checkedConvert('message', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$BaseResponsePageChatFriendApplyVoToJson(
  BaseResponsePageChatFriendApplyVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.toJson(),
  'message': instance.message,
};
