// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_chat_record_query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiChatRecordQueryRequest _$AiChatRecordQueryRequestFromJson(
  Map<String, dynamic> json,
) => AiChatRecordQueryRequest(
  current: (json['current'] as num?)?.toInt(),
  pageSize: (json['pageSize'] as num?)?.toInt(),
  sortField: json['sortField'] as String?,
  sortOrder: json['sortOrder'] as String?,
  sessionId: json['sessionId'] as String?,
  modelType: json['modelType'] as String?,
  searchText: json['searchText'] as String?,
);

Map<String, dynamic> _$AiChatRecordQueryRequestToJson(
  AiChatRecordQueryRequest instance,
) => <String, dynamic>{
  'current': instance.current,
  'pageSize': instance.pageSize,
  'sortField': instance.sortField,
  'sortOrder': instance.sortOrder,
  'sessionId': instance.sessionId,
  'modelType': instance.modelType,
  'searchText': instance.searchText,
};
