// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_file_upload_record_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageFileUploadRecordVo _$BaseResponsePageFileUploadRecordVoFromJson(
  Map json,
) => $checkedCreate('BaseResponsePageFileUploadRecordVo', json, (
  $checkedConvert,
) {
  final val = BaseResponsePageFileUploadRecordVo(
    code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => v == null
          ? null
          : PageFileUploadRecordVo.fromJson(
              Map<String, Object?>.from(v as Map),
            ),
    ),
    message: $checkedConvert('message', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$BaseResponsePageFileUploadRecordVoToJson(
  BaseResponsePageFileUploadRecordVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.toJson(),
  'message': instance.message,
};
