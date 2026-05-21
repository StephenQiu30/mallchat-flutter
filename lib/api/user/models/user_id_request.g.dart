// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_id_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserIdRequest _$UserIdRequestFromJson(Map json) =>
    $checkedCreate('UserIdRequest', json, ($checkedConvert) {
      final val = UserIdRequest(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$UserIdRequestToJson(UserIdRequest instance) =>
    <String, dynamic>{'id': instance.id};
