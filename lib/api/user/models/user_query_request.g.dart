// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserQueryRequest _$UserQueryRequestFromJson(Map json) =>
    $checkedCreate('UserQueryRequest', json, ($checkedConvert) {
      final val = UserQueryRequest(
        current: $checkedConvert('current', (v) => (v as num?)?.toInt()),
        pageSize: $checkedConvert('pageSize', (v) => (v as num?)?.toInt()),
        sortField: $checkedConvert('sortField', (v) => v as String?),
        sortOrder: $checkedConvert('sortOrder', (v) => v as String?),
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        notId: $checkedConvert('notId', (v) => (v as num?)?.toInt()),
        wxUnionId: $checkedConvert('wxUnionId', (v) => v as String?),
        userName: $checkedConvert('userName', (v) => v as String?),
        userRole: $checkedConvert('userRole', (v) => v as String?),
        userPhone: $checkedConvert('userPhone', (v) => v as String?),
        searchText: $checkedConvert('searchText', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$UserQueryRequestToJson(UserQueryRequest instance) =>
    <String, dynamic>{
      'current': instance.current,
      'pageSize': instance.pageSize,
      'sortField': instance.sortField,
      'sortOrder': instance.sortOrder,
      'id': instance.id,
      'notId': instance.notId,
      'wxUnionId': instance.wxUnionId,
      'userName': instance.userName,
      'userRole': instance.userRole,
      'userPhone': instance.userPhone,
      'searchText': instance.searchText,
    };
