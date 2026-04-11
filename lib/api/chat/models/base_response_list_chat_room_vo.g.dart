// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_chat_room_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseListChatRoomVo _$BaseResponseListChatRoomVoFromJson(Map json) =>
    $checkedCreate('BaseResponseListChatRoomVo', json, ($checkedConvert) {
      final val = BaseResponseListChatRoomVo(
        code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => ChatRoomVo.fromJson(Map<String, Object?>.from(e as Map)),
              )
              .toList(),
        ),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BaseResponseListChatRoomVoToJson(
  BaseResponseListChatRoomVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.map((e) => e.toJson()).toList(),
  'message': instance.message,
};
