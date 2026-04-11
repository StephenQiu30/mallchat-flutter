// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_friend_add_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatFriendAddRequest _$ChatFriendAddRequestFromJson(Map json) => $checkedCreate(
  'ChatFriendAddRequest',
  json,
  ($checkedConvert) {
    final val = ChatFriendAddRequest(
      friendUserId: $checkedConvert('friendUserId', (v) => (v as num).toInt()),
    );
    return val;
  },
);

Map<String, dynamic> _$ChatFriendAddRequestToJson(
  ChatFriendAddRequest instance,
) => <String, dynamic>{'friendUserId': instance.friendUserId};
