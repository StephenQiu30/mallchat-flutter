// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'user_operation_result_vo.g.dart';

/// 用户操作结果
@JsonSerializable()
class UserOperationResultVo {
  const UserOperationResultVo({this.success});

  factory UserOperationResultVo.fromJson(Map<String, Object?> json) =>
      _$UserOperationResultVoFromJson(json);

  /// 是否成功
  final bool? success;

  Map<String, Object?> toJson() => _$UserOperationResultVoToJson(this);
}

// Flutter compute serialization functions for UserOperationResultVo
FutureOr<UserOperationResultVo> deserializeUserOperationResultVo(
  Map<String, dynamic> json,
) => UserOperationResultVo.fromJson(json);

FutureOr<List<UserOperationResultVo>> deserializeUserOperationResultVoList(
  List<Map<String, dynamic>> json,
) => json.map((e) => UserOperationResultVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeUserOperationResultVo(
  UserOperationResultVo? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeUserOperationResultVoList(
  List<UserOperationResultVo>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
