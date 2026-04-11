// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_model_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiModelVo _$AiModelVoFromJson(Map json) =>
    $checkedCreate('AiModelVo', json, ($checkedConvert) {
      final val = AiModelVo(
        name: $checkedConvert('name', (v) => v as String?),
        description: $checkedConvert('description', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$AiModelVoToJson(AiModelVo instance) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
};
