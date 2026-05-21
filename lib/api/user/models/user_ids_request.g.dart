// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ids_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserIdsRequest _$UserIdsRequestFromJson(Map json) =>
    $checkedCreate('UserIdsRequest', json, ($checkedConvert) {
      final val = UserIdsRequest(
        ids: $checkedConvert(
          'ids',
          (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UserIdsRequestToJson(UserIdsRequest instance) =>
    <String, dynamic>{'ids': instance.ids};
