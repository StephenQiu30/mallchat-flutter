// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_chat_session_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseListChatSessionVo _$BaseResponseListChatSessionVoFromJson(
  Map json,
) => $checkedCreate('BaseResponseListChatSessionVo', json, ($checkedConvert) {
  final val = BaseResponseListChatSessionVo(
    code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => ChatSessionVo.fromJson(Map<String, Object?>.from(e as Map)),
          )
          .toList(),
    ),
    message: $checkedConvert('message', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$BaseResponseListChatSessionVoToJson(
  BaseResponseListChatSessionVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.map((e) => e.toJson()).toList(),
  'message': instance.message,
};
