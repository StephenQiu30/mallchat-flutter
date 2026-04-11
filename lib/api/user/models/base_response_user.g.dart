// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseUser _$BaseResponseUserFromJson(Map json) =>
    $checkedCreate('BaseResponseUser', json, ($checkedConvert) {
      final val = BaseResponseUser(
        code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => v == null
              ? null
              : User.fromJson(Map<String, Object?>.from(v as Map)),
        ),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BaseResponseUserToJson(BaseResponseUser instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data?.toJson(),
      'message': instance.message,
    };
