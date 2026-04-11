// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseUserVo _$BaseResponseUserVoFromJson(Map json) =>
    $checkedCreate('BaseResponseUserVo', json, ($checkedConvert) {
      final val = BaseResponseUserVo(
        code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => v == null
              ? null
              : UserVo.fromJson(Map<String, Object?>.from(v as Map)),
        ),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BaseResponseUserVoToJson(BaseResponseUserVo instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data?.toJson(),
      'message': instance.message,
    };
