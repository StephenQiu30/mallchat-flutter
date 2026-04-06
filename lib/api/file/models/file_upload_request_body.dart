// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'file_upload_request_body.g.dart';

@JsonSerializable()
class FileUploadRequestBody {
  const FileUploadRequestBody({
    required this.file,
  });
  
  factory FileUploadRequestBody.fromJson(Map<String, Object?> json) => _$FileUploadRequestBodyFromJson(json);
  
  final File file;

  Map<String, Object?> toJson() => _$FileUploadRequestBodyToJson(this);
}
