// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileUploadRequestBody _$FileUploadRequestBodyFromJson(Map json) =>
    $checkedCreate('FileUploadRequestBody', json, ($checkedConvert) {
      final val = FileUploadRequestBody(
        file: $checkedConvert('file', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$FileUploadRequestBodyToJson(
  FileUploadRequestBody instance,
) => <String, dynamic>{'file': instance.file};
