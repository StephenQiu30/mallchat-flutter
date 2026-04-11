// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_page_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponsePageUser _$BaseResponsePageUserFromJson(Map json) =>
    $checkedCreate('BaseResponsePageUser', json, ($checkedConvert) {
      final val = BaseResponsePageUser(
        code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => v == null
              ? null
              : PageUser.fromJson(Map<String, Object?>.from(v as Map)),
        ),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BaseResponsePageUserToJson(
  BaseResponsePageUser instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data?.toJson(),
  'message': instance.message,
};
