// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'delete_request.g.dart';

/// 删除请求
@JsonSerializable()
class DeleteRequest {
  const DeleteRequest({
    required this.id,
  });
  
  factory DeleteRequest.fromJson(Map<String, Object?> json) => _$DeleteRequestFromJson(json);
  
  /// id
  final int id;

  Map<String, Object?> toJson() => _$DeleteRequestToJson(this);
}

// Flutter compute serialization functions for DeleteRequest
FutureOr<DeleteRequest> deserializeDeleteRequest(Map<String, dynamic> json) =>
    DeleteRequest.fromJson(json);

FutureOr<List<DeleteRequest>> deserializeDeleteRequestList(List<Map<String, dynamic>> json) =>
    json.map((e) => DeleteRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeDeleteRequest(DeleteRequest? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeDeleteRequestList(List<DeleteRequest>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
