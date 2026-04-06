// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileVo _$FileVoFromJson(Map<String, dynamic> json) => FileVo(
  url: json['url'] as String?,
  key: json['key'] as String?,
  fileName: json['fileName'] as String?,
  size: (json['size'] as num?)?.toInt(),
);

Map<String, dynamic> _$FileVoToJson(FileVo instance) => <String, dynamic>{
  'url': instance.url,
  'key': instance.key,
  'fileName': instance.fileName,
  'size': instance.size,
};
