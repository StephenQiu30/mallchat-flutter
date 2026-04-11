// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_chat_friend_user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseListChatFriendUserVo _$BaseResponseListChatFriendUserVoFromJson(
  Map json,
) => $checkedCreate('BaseResponseListChatFriendUserVo', json, (
  $checkedConvert,
) {
  final val = BaseResponseListChatFriendUserVo(
    code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) =>
                ChatFriendUserVo.fromJson(Map<String, Object?>.from(e as Map)),
          )
          .toList(),
    ),
    message: $checkedConvert('message', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$BaseResponseListChatFriendUserVoToJson(
  BaseResponseListChatFriendUserVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.map((e) => e.toJson()).toList(),
  'message': instance.message,
};
