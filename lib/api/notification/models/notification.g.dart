// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map json) =>
    $checkedCreate('Notification', json, ($checkedConvert) {
      final val = Notification(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        title: $checkedConvert('title', (v) => v as String?),
        content: $checkedConvert('content', (v) => v as String?),
        type: $checkedConvert('type', (v) => v as String?),
        bizId: $checkedConvert('bizId', (v) => v as String?),
        userId: $checkedConvert('userId', (v) => (v as num?)?.toInt()),
        relatedId: $checkedConvert('relatedId', (v) => (v as num?)?.toInt()),
        relatedType: $checkedConvert('relatedType', (v) => v as String?),
        isRead: $checkedConvert('isRead', (v) => (v as num?)?.toInt()),
        status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
        contentUrl: $checkedConvert('contentUrl', (v) => v as String?),
        createTime: $checkedConvert(
          'createTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        updateTime: $checkedConvert(
          'updateTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        isDelete: $checkedConvert('isDelete', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'type': instance.type,
      'bizId': instance.bizId,
      'userId': instance.userId,
      'relatedId': instance.relatedId,
      'relatedType': instance.relatedType,
      'isRead': instance.isRead,
      'status': instance.status,
      'contentUrl': instance.contentUrl,
      'createTime': instance.createTime?.toIso8601String(),
      'updateTime': instance.updateTime?.toIso8601String(),
      'isDelete': instance.isDelete,
    };
