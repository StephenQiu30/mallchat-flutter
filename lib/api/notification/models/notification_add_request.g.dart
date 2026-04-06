// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_add_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationAddRequest _$NotificationAddRequestFromJson(
  Map<String, dynamic> json,
) => NotificationAddRequest(
  target: json['target'] as String?,
  title: json['title'] as String?,
  content: json['content'] as String?,
  contentUrl: json['contentUrl'] as String?,
);

Map<String, dynamic> _$NotificationAddRequestToJson(
  NotificationAddRequest instance,
) => <String, dynamic>{
  'target': instance.target,
  'title': instance.title,
  'content': instance.content,
  'contentUrl': instance.contentUrl,
};
