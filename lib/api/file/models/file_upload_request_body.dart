// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'file_upload_request_body.g.dart';

@JsonSerializable()
class FileUploadRequestBody {
  const FileUploadRequestBody({required this.file});

  factory FileUploadRequestBody.fromJson(Map<String, Object?> json) =>
      _$FileUploadRequestBodyFromJson(json);

  /// 上传的文件
  final String file;

  Map<String, Object?> toJson() => _$FileUploadRequestBodyToJson(this);
}

// Flutter compute serialization functions for FileUploadRequestBody
FutureOr<FileUploadRequestBody> deserializeFileUploadRequestBody(
  Map<String, dynamic> json,
) => FileUploadRequestBody.fromJson(json);

FutureOr<List<FileUploadRequestBody>> deserializeFileUploadRequestBodyList(
  List<Map<String, dynamic>> json,
) => json.map((e) => FileUploadRequestBody.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeFileUploadRequestBody(
  FileUploadRequestBody? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeFileUploadRequestBodyList(
  List<FileUploadRequestBody>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
