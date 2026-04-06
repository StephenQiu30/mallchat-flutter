// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_chat_message_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseListChatMessageVo _$BaseResponseListChatMessageVoFromJson(
  Map<String, dynamic> json,
) => BaseResponseListChatMessageVo(
  code: (json['code'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ChatMessageVo.fromJson(e as Map<String, dynamic>))
      .toList(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponseListChatMessageVoToJson(
  BaseResponseListChatMessageVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
