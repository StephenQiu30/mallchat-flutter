// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'page_file_upload_record_vo.dart';

part 'base_response_page_file_upload_record_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponsePageFileUploadRecordVo {
  const BaseResponsePageFileUploadRecordVo({
    this.code,
    this.data,
    this.message,
  });

  factory BaseResponsePageFileUploadRecordVo.fromJson(
    Map<String, Object?> json,
  ) => _$BaseResponsePageFileUploadRecordVoFromJson(json);

  /// 状态码
  final int? code;
  final PageFileUploadRecordVo? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() =>
      _$BaseResponsePageFileUploadRecordVoToJson(this);
}

// Flutter compute serialization functions for BaseResponsePageFileUploadRecordVo
FutureOr<BaseResponsePageFileUploadRecordVo>
deserializeBaseResponsePageFileUploadRecordVo(Map<String, dynamic> json) =>
    BaseResponsePageFileUploadRecordVo.fromJson(json);

FutureOr<List<BaseResponsePageFileUploadRecordVo>>
deserializeBaseResponsePageFileUploadRecordVoList(
  List<Map<String, dynamic>> json,
) => json.map((e) => BaseResponsePageFileUploadRecordVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponsePageFileUploadRecordVo(
  BaseResponsePageFileUploadRecordVo? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>>
serializeBaseResponsePageFileUploadRecordVoList(
  List<BaseResponsePageFileUploadRecordVo>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
