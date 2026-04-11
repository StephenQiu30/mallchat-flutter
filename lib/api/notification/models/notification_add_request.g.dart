// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_add_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationAddRequest _$NotificationAddRequestFromJson(Map json) =>
    $checkedCreate('NotificationAddRequest', json, ($checkedConvert) {
      final val = NotificationAddRequest(
        target: $checkedConvert('target', (v) => v as String?),
        title: $checkedConvert('title', (v) => v as String?),
        content: $checkedConvert('content', (v) => v as String?),
        contentUrl: $checkedConvert('contentUrl', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$NotificationAddRequestToJson(
  NotificationAddRequest instance,
) => <String, dynamic>{
  'target': instance.target,
  'title': instance.title,
  'content': instance.content,
  'contentUrl': instance.contentUrl,
};
