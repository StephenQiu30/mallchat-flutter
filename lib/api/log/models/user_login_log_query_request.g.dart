// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_log_query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginLogQueryRequest _$UserLoginLogQueryRequestFromJson(
  Map<String, dynamic> json,
) => UserLoginLogQueryRequest(
  current: (json['current'] as num?)?.toInt(),
  pageSize: (json['pageSize'] as num?)?.toInt(),
  sortField: json['sortField'] as String?,
  sortOrder: json['sortOrder'] as String?,
  id: (json['id'] as num?)?.toInt(),
  userId: (json['userId'] as num?)?.toInt(),
  account: json['account'] as String?,
  loginType: json['loginType'] as String?,
  status: json['status'] as String?,
  clientIp: json['clientIp'] as String?,
  searchText: json['searchText'] as String?,
);

Map<String, dynamic> _$UserLoginLogQueryRequestToJson(
  UserLoginLogQueryRequest instance,
) => <String, dynamic>{
  'current': instance.current,
  'pageSize': instance.pageSize,
  'sortField': instance.sortField,
  'sortOrder': instance.sortOrder,
  'id': instance.id,
  'userId': instance.userId,
  'account': instance.account,
  'loginType': instance.loginType,
  'status': instance.status,
  'clientIp': instance.clientIp,
  'searchText': instance.searchText,
};
