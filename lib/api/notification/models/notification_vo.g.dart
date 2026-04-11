// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationVo _$NotificationVoFromJson(Map json) =>
    $checkedCreate('NotificationVo', json, ($checkedConvert) {
      final val = NotificationVo(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        title: $checkedConvert('title', (v) => v as String?),
        content: $checkedConvert('content', (v) => v as String?),
        type: $checkedConvert('type', (v) => v as String?),
        userId: $checkedConvert('userId', (v) => (v as num?)?.toInt()),
        userVo: $checkedConvert(
          'userVO',
          (v) => v == null
              ? null
              : UserVo.fromJson(Map<String, Object?>.from(v as Map)),
        ),
        relatedId: $checkedConvert('relatedId', (v) => (v as num?)?.toInt()),
        relatedType: $checkedConvert('relatedType', (v) => v as String?),
        isRead: $checkedConvert('isRead', (v) => (v as num?)?.toInt()),
        status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
        contentUrl: $checkedConvert('contentUrl', (v) => v as String?),
        bizId: $checkedConvert('bizId', (v) => v as String?),
        createTime: $checkedConvert(
          'createTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        updateTime: $checkedConvert(
          'updateTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    }, fieldKeyMap: const {'userVo': 'userVO'});

Map<String, dynamic> _$NotificationVoToJson(NotificationVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'type': instance.type,
      'userId': instance.userId,
      'userVO': instance.userVo?.toJson(),
      'relatedId': instance.relatedId,
      'relatedType': instance.relatedType,
      'isRead': instance.isRead,
      'status': instance.status,
      'contentUrl': instance.contentUrl,
      'bizId': instance.bizId,
      'createTime': instance.createTime?.toIso8601String(),
      'updateTime': instance.updateTime?.toIso8601String(),
    };
