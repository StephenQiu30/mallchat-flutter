// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_long.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseListLong _$BaseResponseListLongFromJson(Map json) =>
    $checkedCreate('BaseResponseListLong', json, ($checkedConvert) {
      final val = BaseResponseListLong(
        code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
        ),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BaseResponseListLongToJson(
  BaseResponseListLong instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
