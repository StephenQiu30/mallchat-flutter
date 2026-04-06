// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationVo _$NotificationVoFromJson(Map<String, dynamic> json) =>
    NotificationVo(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      userVo: json['userVO'] == null
          ? null
          : UserVo.fromJson(json['userVO'] as Map<String, dynamic>),
      relatedId: (json['relatedId'] as num?)?.toInt(),
      relatedType: json['relatedType'] as String?,
      isRead: (json['isRead'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      contentUrl: json['contentUrl'] as String?,
      bizId: json['bizId'] as String?,
      createTime: json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
      updateTime: json['updateTime'] == null
          ? null
          : DateTime.parse(json['updateTime'] as String),
    );

Map<String, dynamic> _$NotificationVoToJson(NotificationVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'type': instance.type,
      'userId': instance.userId,
      'userVO': instance.userVo,
      'relatedId': instance.relatedId,
      'relatedType': instance.relatedType,
      'isRead': instance.isRead,
      'status': instance.status,
      'contentUrl': instance.contentUrl,
      'bizId': instance.bizId,
      'createTime': instance.createTime?.toIso8601String(),
      'updateTime': instance.updateTime?.toIso8601String(),
    };
