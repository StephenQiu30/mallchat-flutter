// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_friend_apply_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatFriendApplyRequest _$ChatFriendApplyRequestFromJson(Map json) =>
    $checkedCreate('ChatFriendApplyRequest', json, ($checkedConvert) {
      final val = ChatFriendApplyRequest(
        targetId: $checkedConvert('targetId', (v) => (v as num).toInt()),
        msg: $checkedConvert('msg', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ChatFriendApplyRequestToJson(
  ChatFriendApplyRequest instance,
) => <String, dynamic>{'targetId': instance.targetId, 'msg': instance.msg};
