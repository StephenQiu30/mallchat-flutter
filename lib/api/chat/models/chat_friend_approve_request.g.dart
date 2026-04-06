// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_friend_approve_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatFriendApproveRequest _$ChatFriendApproveRequestFromJson(
  Map<String, dynamic> json,
) => ChatFriendApproveRequest(
  applyId: (json['applyId'] as num).toInt(),
  status: (json['status'] as num).toInt(),
);

Map<String, dynamic> _$ChatFriendApproveRequestToJson(
  ChatFriendApproveRequest instance,
) => <String, dynamic>{'applyId': instance.applyId, 'status': instance.status};
