// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageVo _$ChatMessageVoFromJson(Map<String, dynamic> json) =>
    ChatMessageVo(
      id: (json['id'] as num?)?.toInt(),
      roomId: (json['roomId'] as num?)?.toInt(),
      fromUserId: (json['fromUserId'] as num?)?.toInt(),
      fromUserName: json['fromUserName'] as String?,
      fromUserAvatar: json['fromUserAvatar'] as String?,
      content: json['content'] as String?,
      type: (json['type'] as num?)?.toInt(),
      createTime: json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
    );

Map<String, dynamic> _$ChatMessageVoToJson(ChatMessageVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomId': instance.roomId,
      'fromUserId': instance.fromUserId,
      'fromUserName': instance.fromUserName,
      'fromUserAvatar': instance.fromUserAvatar,
      'content': instance.content,
      'type': instance.type,
      'createTime': instance.createTime?.toIso8601String(),
    };
