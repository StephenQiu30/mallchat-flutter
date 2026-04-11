// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list_user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseListUserVo _$BaseResponseListUserVoFromJson(Map json) =>
    $checkedCreate('BaseResponseListUserVo', json, ($checkedConvert) {
      final val = BaseResponseListUserVo(
        code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>?)
              ?.map((e) => UserVo.fromJson(Map<String, Object?>.from(e as Map)))
              .toList(),
        ),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BaseResponseListUserVoToJson(
  BaseResponseListUserVo instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.map((e) => e.toJson()).toList(),
  'message': instance.message,
};
