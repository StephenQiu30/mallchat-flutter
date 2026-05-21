// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_operation_result_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOperationResultVo _$UserOperationResultVoFromJson(Map json) =>
    $checkedCreate('UserOperationResultVo', json, ($checkedConvert) {
      final val = UserOperationResultVo(
        success: $checkedConvert('success', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$UserOperationResultVoToJson(
  UserOperationResultVo instance,
) => <String, dynamic>{'success': instance.success};
