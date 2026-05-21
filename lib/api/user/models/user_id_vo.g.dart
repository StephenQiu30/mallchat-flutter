// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_id_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserIdVo _$UserIdVoFromJson(Map json) => $checkedCreate('UserIdVo', json, (
  $checkedConvert,
) {
  final val = UserIdVo(id: $checkedConvert('id', (v) => (v as num?)?.toInt()));
  return val;
});

Map<String, dynamic> _$UserIdVoToJson(UserIdVo instance) => <String, dynamic>{
  'id': instance.id,
};
