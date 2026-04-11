// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageUserVo _$BaseResponsePageUserVoFromJson(Map json) =>
    $checkedCreate('BaseResponsePageUserVo', json, ($checkedConvert) {
      final val = BaseResponsePageUserVo(
        code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => v == null
              ? null
              : PageUserVo.fromJson(Map<String, Object?>.from(v as Map)),
        ),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BaseResponsePageUserVoToJson(
  BaseResponsePageUserVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.toJson(),
  'message': instance.message,
};
