// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_friend_approve_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatFriendApproveRequest _$ChatFriendApproveRequestFromJson(Map json) =>
    $checkedCreate('ChatFriendApproveRequest', json, ($checkedConvert) {
      final val = ChatFriendApproveRequest(
        applyId: $checkedConvert('applyId', (v) => (v as num).toInt()),
        status: $checkedConvert('status', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$ChatFriendApproveRequestToJson(
  ChatFriendApproveRequest instance,
) => <String, dynamic>{'applyId': instance.applyId, 'status': instance.status};
