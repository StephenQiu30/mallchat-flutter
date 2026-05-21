// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'user_operation_result_vo.dart';

part 'base_response_user_operation_result_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseUserOperationResultVo {
  const BaseResponseUserOperationResultVo({this.code, this.data, this.message});

  factory BaseResponseUserOperationResultVo.fromJson(
    Map<String, Object?> json,
  ) => _$BaseResponseUserOperationResultVoFromJson(json);

  /// 状态码
  final int? code;
  final UserOperationResultVo? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() =>
      _$BaseResponseUserOperationResultVoToJson(this);
}

// Flutter compute serialization functions for BaseResponseUserOperationResultVo
FutureOr<BaseResponseUserOperationResultVo>
deserializeBaseResponseUserOperationResultVo(Map<String, dynamic> json) =>
    BaseResponseUserOperationResultVo.fromJson(json);

FutureOr<List<BaseResponseUserOperationResultVo>>
deserializeBaseResponseUserOperationResultVoList(
  List<Map<String, dynamic>> json,
) => json.map((e) => BaseResponseUserOperationResultVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponseUserOperationResultVo(
  BaseResponseUserOperationResultVo? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>>
serializeBaseResponseUserOperationResultVoList(
  List<BaseResponseUserOperationResultVo>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
