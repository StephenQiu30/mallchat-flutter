// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_operation_log_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageOperationLogVo _$BaseResponsePageOperationLogVoFromJson(
  Map json,
) => $checkedCreate('BaseResponsePageOperationLogVo', json, ($checkedConvert) {
  final val = BaseResponsePageOperationLogVo(
    code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => v == null
          ? null
          : PageOperationLogVo.fromJson(Map<String, Object?>.from(v as Map)),
    ),
    message: $checkedConvert('message', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$BaseResponsePageOperationLogVoToJson(
  BaseResponsePageOperationLogVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.toJson(),
  'message': instance.message,
};
