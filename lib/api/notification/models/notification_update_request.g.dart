// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationUpdateRequest _$NotificationUpdateRequestFromJson(
  Map<String, dynamic> json,
) => NotificationUpdateRequest(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  content: json['content'] as String?,
  type: json['type'] as String?,
  userId: (json['userId'] as num?)?.toInt(),
  relatedId: (json['relatedId'] as num?)?.toInt(),
  relatedType: json['relatedType'] as String?,
  contentUrl: json['contentUrl'] as String?,
);

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
