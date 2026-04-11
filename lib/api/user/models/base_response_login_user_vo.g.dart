// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_login_user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseLoginUserVo _$BaseResponseLoginUserVoFromJson(Map json) =>
    $checkedCreate('BaseResponseLoginUserVo', json, ($checkedConvert) {
      final val = BaseResponseLoginUserVo(
        code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => v == null
              ? null
              : LoginUserVo.fromJson(Map<String, Object?>.from(v as Map)),
        ),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BaseResponseLoginUserVoToJson(
  BaseResponseLoginUserVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.toJson(),
  'message': instance.message,
};
