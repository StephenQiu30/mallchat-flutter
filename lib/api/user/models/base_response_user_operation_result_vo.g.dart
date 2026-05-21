// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_user_operation_result_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseUserOperationResultVo _$BaseResponseUserOperationResultVoFromJson(
  Map json,
) => $checkedCreate('BaseResponseUserOperationResultVo', json, (
  $checkedConvert,
) {
  final val = BaseResponseUserOperationResultVo(
    code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => v == null
          ? null
          : UserOperationResultVo.fromJson(Map<String, Object?>.from(v as Map)),
    ),
    message: $checkedConvert('message', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$BaseResponseUserOperationResultVoToJson(
  BaseResponseUserOperationResultVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.toJson(),
  'message': instance.message,
};
