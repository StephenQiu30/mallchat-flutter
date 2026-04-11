// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_ai_model_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseListAiModelVo _$BaseResponseListAiModelVoFromJson(Map json) =>
    $checkedCreate('BaseResponseListAiModelVo', json, ($checkedConvert) {
      final val = BaseResponseListAiModelVo(
        code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => AiModelVo.fromJson(Map<String, Object?>.from(e as Map)),
              )
              .toList(),
        ),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BaseResponseListAiModelVoToJson(
  BaseResponseListAiModelVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.map((e) => e.toJson()).toList(),
  'message': instance.message,
};
