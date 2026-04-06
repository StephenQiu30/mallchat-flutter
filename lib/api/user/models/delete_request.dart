// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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
