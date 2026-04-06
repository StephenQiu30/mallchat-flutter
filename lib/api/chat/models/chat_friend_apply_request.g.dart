// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_friend_apply_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatFriendApplyRequest _$ChatFriendApplyRequestFromJson(
  Map<String, dynamic> json,
) => ChatFriendApplyRequest(
  targetId: (json['targetId'] as num).toInt(),
  msg: json['msg'] as String,
);

Map<String, dynamic> _$ChatFriendApplyRequestToJson(
  ChatFriendApplyRequest instance,
) => <String, dynamic>{'targetId': instance.targetId, 'msg': instance.msg};
