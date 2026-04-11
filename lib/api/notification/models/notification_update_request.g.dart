// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationUpdateRequest _$NotificationUpdateRequestFromJson(Map json) =>
    $checkedCreate('NotificationUpdateRequest', json, ($checkedConvert) {
      final val = NotificationUpdateRequest(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        title: $checkedConvert('title', (v) => v as String?),
        content: $checkedConvert('content', (v) => v as String?),
        type: $checkedConvert('type', (v) => v as String?),
        userId: $checkedConvert('userId', (v) => (v as num?)?.toInt()),
        relatedId: $checkedConvert('relatedId', (v) => (v as num?)?.toInt()),
        relatedType: $checkedConvert('relatedType', (v) => v as String?),
        contentUrl: $checkedConvert('contentUrl', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$NotificationUpdateRequestToJson(
  NotificationUpdateRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'content': instance.content,
  'type': instance.type,
  'userId': instance.userId,
  'relatedId': instance.relatedId,
  'relatedType': instance.relatedType,
  'contentUrl': instance.contentUrl,
};
