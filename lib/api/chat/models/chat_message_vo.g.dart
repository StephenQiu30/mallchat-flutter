// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageVo _$ChatMessageVoFromJson(Map json) =>
    $checkedCreate('ChatMessageVo', json, ($checkedConvert) {
      final val = ChatMessageVo(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        roomId: $checkedConvert('roomId', (v) => (v as num?)?.toInt()),
        fromUserId: $checkedConvert('fromUserId', (v) => (v as num?)?.toInt()),
        fromUserName: $checkedConvert('fromUserName', (v) => v as String?),
        fromUserAvatar: $checkedConvert('fromUserAvatar', (v) => v as String?),
        content: $checkedConvert('content', (v) => v as String?),
        type: $checkedConvert('type', (v) => (v as num?)?.toInt()),
        extra: $checkedConvert('extra', (v) => v as String?),
        replyMsg: $checkedConvert(
          'replyMsg',
          (v) => v == null
              ? null
              : ReplyMsgVo.fromJson(Map<String, Object?>.from(v as Map)),
        ),
        status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
        createTime: $checkedConvert(
          'createTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ChatMessageVoToJson(ChatMessageVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomId': instance.roomId,
      'fromUserId': instance.fromUserId,
      'fromUserName': instance.fromUserName,
      'fromUserAvatar': instance.fromUserAvatar,
      'content': instance.content,
      'type': instance.type,
      'extra': instance.extra,
      'replyMsg': instance.replyMsg?.toJson(),
      'status': instance.status,
      'createTime': instance.createTime?.toIso8601String(),
    };
