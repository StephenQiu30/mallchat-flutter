// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_chat_message_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseListChatMessageVo _$BaseResponseListChatMessageVoFromJson(
  Map json,
) => $checkedCreate('BaseResponseListChatMessageVo', json, ($checkedConvert) {
  final val = BaseResponseListChatMessageVo(
    code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => ChatMessageVo.fromJson(Map<String, Object?>.from(e as Map)),
          )
          .toList(),
    ),
    message: $checkedConvert('message', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$BaseResponseListChatMessageVoToJson(
  BaseResponseListChatMessageVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.map((e) => e.toJson()).toList(),
  'message': instance.message,
};
