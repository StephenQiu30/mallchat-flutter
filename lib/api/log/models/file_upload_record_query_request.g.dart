// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_record_query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileUploadRecordQueryRequest _$FileUploadRecordQueryRequestFromJson(Map json) =>
    $checkedCreate('FileUploadRecordQueryRequest', json, ($checkedConvert) {
      final val = FileUploadRecordQueryRequest(
        current: $checkedConvert('current', (v) => (v as num?)?.toInt()),
        pageSize: $checkedConvert('pageSize', (v) => (v as num?)?.toInt()),
        sortField: $checkedConvert('sortField', (v) => v as String?),
        sortOrder: $checkedConvert('sortOrder', (v) => v as String?),
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        userId: $checkedConvert('userId', (v) => (v as num?)?.toInt()),
        bizType: $checkedConvert('bizType', (v) => v as String?),
        fileName: $checkedConvert('fileName', (v) => v as String?),
        status: $checkedConvert('status', (v) => v as String?),
        searchText: $checkedConvert('searchText', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$FileUploadRecordQueryRequestToJson(
  FileUploadRecordQueryRequest instance,
) => <String, dynamic>{
  'current': instance.current,
  'pageSize': instance.pageSize,
  'sortField': instance.sortField,
  'sortOrder': instance.sortOrder,
  'id': instance.id,
  'userId': instance.userId,
  'bizType': instance.bizType,
  'fileName': instance.fileName,
  'status': instance.status,
  'searchText': instance.searchText,
};
