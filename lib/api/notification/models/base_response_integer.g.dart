// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_integer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseInteger _$BaseResponseIntegerFromJson(Map json) =>
    $checkedCreate('BaseResponseInteger', json, ($checkedConvert) {
      final val = BaseResponseInteger(
        code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
        data: $checkedConvert('data', (v) => (v as num?)?.toInt()),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BaseResponseIntegerToJson(
  BaseResponseInteger instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
