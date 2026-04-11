// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_long.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseLong _$BaseResponseLongFromJson(Map json) =>
    $checkedCreate('BaseResponseLong', json, ($checkedConvert) {
      final val = BaseResponseLong(
        code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
        data: $checkedConvert('data', (v) => (v as num?)?.toInt()),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BaseResponseLongToJson(BaseResponseLong instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };
