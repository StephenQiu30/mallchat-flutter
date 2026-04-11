// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_friend_apply_query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatFriendApplyQueryRequest _$ChatFriendApplyQueryRequestFromJson(Map json) =>
    $checkedCreate('ChatFriendApplyQueryRequest', json, ($checkedConvert) {
      final val = ChatFriendApplyQueryRequest(
        current: $checkedConvert('current', (v) => (v as num?)?.toInt()),
        pageSize: $checkedConvert('pageSize', (v) => (v as num?)?.toInt()),
        sortField: $checkedConvert('sortField', (v) => v as String?),
        sortOrder: $checkedConvert('sortOrder', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ChatFriendApplyQueryRequestToJson(
  ChatFriendApplyQueryRequest instance,
) => <String, dynamic>{
  'current': instance.current,
  'pageSize': instance.pageSize,
  'sortField': instance.sortField,
  'sortOrder': instance.sortOrder,
};
