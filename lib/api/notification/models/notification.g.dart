// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  content: json['content'] as String?,
  type: json['type'] as String?,
  bizId: json['bizId'] as String?,
  userId: (json['userId'] as num?)?.toInt(),
  relatedId: (json['relatedId'] as num?)?.toInt(),
  relatedType: json['relatedType'] as String?,
  isRead: (json['isRead'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
  contentUrl: json['contentUrl'] as String?,
  createTime: json['createTime'] == null
      ? null
      : DateTime.parse(json['createTime'] as String),
  updateTime: json['updateTime'] == null
      ? null
      : DateTime.parse(json['updateTime'] as String),
  isDelete: (json['isDelete'] as num?)?.toInt(),
);

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
