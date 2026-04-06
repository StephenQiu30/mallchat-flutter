// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_record_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileUploadRecordVo _$FileUploadRecordVoFromJson(Map<String, dynamic> json) =>
    FileUploadRecordVo(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      bizType: json['bizType'] as String?,
      fileName: json['fileName'] as String?,
      fileSize: (json['fileSize'] as num?)?.toInt(),
      fileSuffix: json['fileSuffix'] as String?,
      contentType: json['contentType'] as String?,
      storageType: json['storageType'] as String?,
      bucket: json['bucket'] as String?,
      objectKey: json['objectKey'] as String?,
      url: json['url'] as String?,
      md5: json['md5'] as String?,
      clientIp: json['clientIp'] as String?,
      status: json['status'] as String?,
      errorMessage: json['errorMessage'] as String?,
      createTime: json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
      updateTime: json['updateTime'] == null
          ? null
          : DateTime.parse(json['updateTime'] as String),
    );

Map<String, dynamic> _$FileUploadRecordVoToJson(FileUploadRecordVo instance) =>
    <String, dynamic>{
      'id': instance.id,
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
      'createTime': instance.createTime?.toIso8601String(),
      'updateTime': instance.updateTime?.toIso8601String(),
    };
