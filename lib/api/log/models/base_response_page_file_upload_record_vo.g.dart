// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_file_upload_record_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageFileUploadRecordVo _$BaseResponsePageFileUploadRecordVoFromJson(
  Map<String, dynamic> json,
) => BaseResponsePageFileUploadRecordVo(
  code: (json['code'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : PageFileUploadRecordVo.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponsePageFileUploadRecordVoToJson(
  BaseResponsePageFileUploadRecordVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
