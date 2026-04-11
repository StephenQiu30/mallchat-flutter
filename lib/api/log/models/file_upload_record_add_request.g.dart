// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_record_add_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileUploadRecordAddRequest _$FileUploadRecordAddRequestFromJson(Map json) =>
    $checkedCreate('FileUploadRecordAddRequest', json, ($checkedConvert) {
      final val = FileUploadRecordAddRequest(
        userId: $checkedConvert('userId', (v) => (v as num?)?.toInt()),
        bizType: $checkedConvert('bizType', (v) => v as String?),
        fileName: $checkedConvert('fileName', (v) => v as String?),
        fileSize: $checkedConvert('fileSize', (v) => (v as num?)?.toInt()),
        fileSuffix: $checkedConvert('fileSuffix', (v) => v as String?),
        contentType: $checkedConvert('contentType', (v) => v as String?),
        storageType: $checkedConvert('storageType', (v) => v as String?),
        bucket: $checkedConvert('bucket', (v) => v as String?),
        objectKey: $checkedConvert('objectKey', (v) => v as String?),
        url: $checkedConvert('url', (v) => v as String?),
        md5: $checkedConvert('md5', (v) => v as String?),
        clientIp: $checkedConvert('clientIp', (v) => v as String?),
        status: $checkedConvert('status', (v) => v as String?),
        errorMessage: $checkedConvert('errorMessage', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$FileUploadRecordAddRequestToJson(
  FileUploadRecordAddRequest instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'bizType': instance.bizType,
  'fileName': instance.fileName,
  'fileSize': instance.fileSize,
  'fileSuffix': instance.fileSuffix,
  'contentType': instance.contentType,
  'storageType': instance.storageType,
  'bucket': instance.bucket,
  'objectKey': instance.objectKey,
  'url': instance.url,
  'md5': instance.md5,
  'clientIp': instance.clientIp,
  'status': instance.status,
  'errorMessage': instance.errorMessage,
};
