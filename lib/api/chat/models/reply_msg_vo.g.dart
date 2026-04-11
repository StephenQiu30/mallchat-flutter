// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply_msg_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplyMsgVo _$ReplyMsgVoFromJson(Map json) =>
    $checkedCreate('ReplyMsgVo', json, ($checkedConvert) {
      final val = ReplyMsgVo(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        userName: $checkedConvert('userName', (v) => v as String?),
        content: $checkedConvert('content', (v) => v as String?),
        type: $checkedConvert('type', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$ReplyMsgVoToJson(ReplyMsgVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'content': instance.content,
      'type': instance.type,
    };
