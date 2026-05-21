// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_user_admin_status_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseUserAdminStatusVo _$BaseResponseUserAdminStatusVoFromJson(
  Map json,
) => $checkedCreate('BaseResponseUserAdminStatusVo', json, ($checkedConvert) {
  final val = BaseResponseUserAdminStatusVo(
    code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => v == null
          ? null
          : UserAdminStatusVo.fromJson(Map<String, Object?>.from(v as Map)),
    ),
    message: $checkedConvert('message', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$BaseResponseUserAdminStatusVoToJson(
  BaseResponseUserAdminStatusVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.toJson(),
  'message': instance.message,
};
