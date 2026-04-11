// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_file_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseFileVo _$BaseResponseFileVoFromJson(Map json) =>
    $checkedCreate('BaseResponseFileVo', json, ($checkedConvert) {
      final val = BaseResponseFileVo(
        code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => v == null
              ? null
              : FileVo.fromJson(Map<String, Object?>.from(v as Map)),
        ),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BaseResponseFileVoToJson(BaseResponseFileVo instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data?.toJson(),
      'message': instance.message,
    };
