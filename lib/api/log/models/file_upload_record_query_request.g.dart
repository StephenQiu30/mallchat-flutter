// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_record_query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileUploadRecordQueryRequest _$FileUploadRecordQueryRequestFromJson(
  Map<String, dynamic> json,
) => FileUploadRecordQueryRequest(
  current: (json['current'] as num?)?.toInt(),
  pageSize: (json['pageSize'] as num?)?.toInt(),
  sortField: json['sortField'] as String?,
  sortOrder: json['sortOrder'] as String?,
  id: (json['id'] as num?)?.toInt(),
  userId: (json['userId'] as num?)?.toInt(),
  bizType: json['bizType'] as String?,
  fileName: json['fileName'] as String?,
  status: json['status'] as String?,
  searchText: json['searchText'] as String?,
);

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
