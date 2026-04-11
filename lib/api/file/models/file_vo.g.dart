// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileVo _$FileVoFromJson(Map json) =>
    $checkedCreate('FileVo', json, ($checkedConvert) {
      final val = FileVo(
        url: $checkedConvert('url', (v) => v as String?),
        key: $checkedConvert('key', (v) => v as String?),
        fileName: $checkedConvert('fileName', (v) => v as String?),
        size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$FileVoToJson(FileVo instance) => <String, dynamic>{
  'url': instance.url,
  'key': instance.key,
  'fileName': instance.fileName,
  'size': instance.size,
};
