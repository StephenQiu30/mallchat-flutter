// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_user_login_log_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageUserLoginLogVo _$BaseResponsePageUserLoginLogVoFromJson(
  Map json,
) => $checkedCreate('BaseResponsePageUserLoginLogVo', json, ($checkedConvert) {
  final val = BaseResponsePageUserLoginLogVo(
    code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => v == null
          ? null
          : PageUserLoginLogVo.fromJson(Map<String, Object?>.from(v as Map)),
    ),
    message: $checkedConvert('message', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$BaseResponsePageUserLoginLogVoToJson(
  BaseResponsePageUserLoginLogVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.toJson(),
  'message': instance.message,
};
