// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_boolean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseBoolean _$BaseResponseBooleanFromJson(Map json) =>
    $checkedCreate('BaseResponseBoolean', json, ($checkedConvert) {
      final val = BaseResponseBoolean(
        code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
        data: $checkedConvert('data', (v) => v as bool?),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BaseResponseBooleanToJson(
  BaseResponseBoolean instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
