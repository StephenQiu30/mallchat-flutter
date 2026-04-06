// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_operation_log_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageOperationLogVo _$BaseResponsePageOperationLogVoFromJson(
  Map<String, dynamic> json,
) => BaseResponsePageOperationLogVo(
  code: (json['code'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : PageOperationLogVo.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponsePageOperationLogVoToJson(
  BaseResponsePageOperationLogVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
