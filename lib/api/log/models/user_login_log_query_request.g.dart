// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_log_query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginLogQueryRequest _$UserLoginLogQueryRequestFromJson(Map json) =>
    $checkedCreate('UserLoginLogQueryRequest', json, ($checkedConvert) {
      final val = UserLoginLogQueryRequest(
        current: $checkedConvert('current', (v) => (v as num?)?.toInt()),
        pageSize: $checkedConvert('pageSize', (v) => (v as num?)?.toInt()),
        sortField: $checkedConvert('sortField', (v) => v as String?),
        sortOrder: $checkedConvert('sortOrder', (v) => v as String?),
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        userId: $checkedConvert('userId', (v) => (v as num?)?.toInt()),
        account: $checkedConvert('account', (v) => v as String?),
        loginType: $checkedConvert('loginType', (v) => v as String?),
        status: $checkedConvert('status', (v) => v as String?),
        clientIp: $checkedConvert('clientIp', (v) => v as String?),
        searchText: $checkedConvert('searchText', (v) => v as String?),
      );
      return val;
    });

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
