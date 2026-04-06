// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_ai_model_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseListAiModelVo _$BaseResponseListAiModelVoFromJson(
  Map<String, dynamic> json,
) => BaseResponseListAiModelVo(
  code: (json['code'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => AiModelVo.fromJson(e as Map<String, dynamic>))
      .toList(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponseListAiModelVoToJson(
  BaseResponseListAiModelVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
