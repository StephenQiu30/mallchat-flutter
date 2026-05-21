// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_ai_operation_result_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseAiOperationResultVo _$BaseResponseAiOperationResultVoFromJson(
  Map json,
) => $checkedCreate('BaseResponseAiOperationResultVo', json, ($checkedConvert) {
  final val = BaseResponseAiOperationResultVo(
    code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => v == null
          ? null
          : AiOperationResultVo.fromJson(Map<String, Object?>.from(v as Map)),
    ),
    message: $checkedConvert('message', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$BaseResponseAiOperationResultVoToJson(
  BaseResponseAiOperationResultVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.toJson(),
  'message': instance.message,
};
