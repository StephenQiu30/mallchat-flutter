// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_chat_record_query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiChatRecordQueryRequest _$AiChatRecordQueryRequestFromJson(Map json) =>
    $checkedCreate('AiChatRecordQueryRequest', json, ($checkedConvert) {
      final val = AiChatRecordQueryRequest(
        current: $checkedConvert('current', (v) => (v as num?)?.toInt()),
        pageSize: $checkedConvert('pageSize', (v) => (v as num?)?.toInt()),
        sortField: $checkedConvert('sortField', (v) => v as String?),
        sortOrder: $checkedConvert('sortOrder', (v) => v as String?),
        sessionId: $checkedConvert('sessionId', (v) => v as String?),
        modelType: $checkedConvert('modelType', (v) => v as String?),
        searchText: $checkedConvert('searchText', (v) => v as String?),
      );
      return val;
    });

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
