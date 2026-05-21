// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_operation_result_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiOperationResultVo _$AiOperationResultVoFromJson(Map json) =>
    $checkedCreate('AiOperationResultVo', json, ($checkedConvert) {
      final val = AiOperationResultVo(
        success: $checkedConvert('success', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$AiOperationResultVoToJson(
  AiOperationResultVo instance,
) => <String, dynamic>{'success': instance.success};
