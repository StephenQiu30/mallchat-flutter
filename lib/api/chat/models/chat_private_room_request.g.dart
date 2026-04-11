// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_private_room_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatPrivateRoomRequest _$ChatPrivateRoomRequestFromJson(Map json) =>
    $checkedCreate('ChatPrivateRoomRequest', json, ($checkedConvert) {
      final val = ChatPrivateRoomRequest(
        peerUserId: $checkedConvert('peerUserId', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$ChatPrivateRoomRequestToJson(
  ChatPrivateRoomRequest instance,
) => <String, dynamic>{'peerUserId': instance.peerUserId};
