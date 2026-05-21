// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'ai_chat_record_delete_request.g.dart';

/// AI对话记录删除请求
@JsonSerializable()
class AiChatRecordDeleteRequest {
  const AiChatRecordDeleteRequest({required this.id});

  factory AiChatRecordDeleteRequest.fromJson(Map<String, Object?> json) =>
      _$AiChatRecordDeleteRequestFromJson(json);

  /// 对话记录ID
  final int id;

  Map<String, Object?> toJson() => _$AiChatRecordDeleteRequestToJson(this);
}

// Flutter compute serialization functions for AiChatRecordDeleteRequest
FutureOr<AiChatRecordDeleteRequest> deserializeAiChatRecordDeleteRequest(
  Map<String, dynamic> json,
) => AiChatRecordDeleteRequest.fromJson(json);

FutureOr<List<AiChatRecordDeleteRequest>>
deserializeAiChatRecordDeleteRequestList(List<Map<String, dynamic>> json) =>
    json.map((e) => AiChatRecordDeleteRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeAiChatRecordDeleteRequest(
  AiChatRecordDeleteRequest? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeAiChatRecordDeleteRequestList(
  List<AiChatRecordDeleteRequest>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
