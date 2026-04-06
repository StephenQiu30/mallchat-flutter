// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'file_upload_record_add_request.g.dart';

/// 文件上传记录创建请求
@JsonSerializable()
class FileUploadRecordAddRequest {
  const FileUploadRecordAddRequest({
    this.userId,
    this.bizType,
    this.fileName,
    this.fileSize,
    this.fileSuffix,
    this.contentType,
    this.storageType,
    this.bucket,
    this.objectKey,
    this.url,
    this.md5,
    this.clientIp,
    this.status,
    this.errorMessage,
  });
  
  factory FileUploadRecordAddRequest.fromJson(Map<String, Object?> json) => _$FileUploadRecordAddRequestFromJson(json);
  
  /// 上传用户ID
  final int? userId;

  /// 业务类型
  final String? bizType;

  /// 原始文件名
  final String? fileName;

  /// 文件大小
  final int? fileSize;

  /// 文件后缀
  final String? fileSuffix;

  /// 内容类型
  final String? contentType;

  /// 存储类型
  final String? storageType;

  /// 存储桶
  final String? bucket;

  /// 对象键/路径
  final String? objectKey;

  /// 访问URL
  final String? url;

  /// 文件MD5
  final String? md5;

  /// 客户端IP
  final String? clientIp;

  /// 上传状态
  final String? status;

  /// 错误信息
  final String? errorMessage;

  Map<String, Object?> toJson() => _$FileUploadRecordAddRequestToJson(this);
}
