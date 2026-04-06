// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_chat_session_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseListChatSessionVo _$BaseResponseListChatSessionVoFromJson(
  Map<String, dynamic> json,
) => BaseResponseListChatSessionVo(
  code: (json['code'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ChatSessionVo.fromJson(e as Map<String, dynamic>))
      .toList(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponseListChatSessionVoToJson(
  BaseResponseListChatSessionVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
