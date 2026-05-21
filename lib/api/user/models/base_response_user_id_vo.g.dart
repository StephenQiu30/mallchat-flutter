// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_user_id_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseUserIdVo _$BaseResponseUserIdVoFromJson(Map json) =>
    $checkedCreate('BaseResponseUserIdVo', json, ($checkedConvert) {
      final val = BaseResponseUserIdVo(
        code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => v == null
              ? null
              : UserIdVo.fromJson(Map<String, Object?>.from(v as Map)),
        ),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BaseResponseUserIdVoToJson(
  BaseResponseUserIdVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.toJson(),
  'message': instance.message,
};
