// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserQueryRequest _$UserQueryRequestFromJson(Map<String, dynamic> json) =>
    UserQueryRequest(
      current: (json['current'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      sortField: json['sortField'] as String?,
      sortOrder: json['sortOrder'] as String?,
      id: (json['id'] as num?)?.toInt(),
      notId: (json['notId'] as num?)?.toInt(),
      wxUnionId: json['wxUnionId'] as String?,
      mpOpenId: json['mpOpenId'] as String?,
      userName: json['userName'] as String?,
      userRole: json['userRole'] as String?,
      userPhone: json['userPhone'] as String?,
      searchText: json['searchText'] as String?,
    );

Map<String, dynamic> _$UserQueryRequestToJson(UserQueryRequest instance) =>
    <String, dynamic>{
      'current': instance.current,
      'pageSize': instance.pageSize,
      'sortField': instance.sortField,
      'sortOrder': instance.sortOrder,
      'id': instance.id,
      'notId': instance.notId,
      'wxUnionId': instance.wxUnionId,
      'mpOpenId': instance.mpOpenId,
      'userName': instance.userName,
      'userRole': instance.userRole,
      'userPhone': instance.userPhone,
      'searchText': instance.searchText,
    };
