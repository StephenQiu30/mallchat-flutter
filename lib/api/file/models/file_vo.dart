// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'file_vo.g.dart';

/// 文件信息视图
@JsonSerializable()
class FileVo {
  const FileVo({
    this.url,
    this.key,
    this.fileName,
    this.size,
  });
  
  factory FileVo.fromJson(Map<String, Object?> json) => _$FileVoFromJson(json);
  
  /// 文件访问链接
  final String? url;

  /// 文件对象Key
  final String? key;

  /// 文件名
  final String? fileName;

  /// 文件大小 (bytes)
  final int? size;

  Map<String, Object?> toJson() => _$FileVoToJson(this);
}
