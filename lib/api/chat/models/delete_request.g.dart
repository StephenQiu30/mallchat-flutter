// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteRequest _$DeleteRequestFromJson(Map json) =>
    $checkedCreate('DeleteRequest', json, ($checkedConvert) {
      final val = DeleteRequest(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$DeleteRequestToJson(DeleteRequest instance) =>
    <String, dynamic>{'id': instance.id};
