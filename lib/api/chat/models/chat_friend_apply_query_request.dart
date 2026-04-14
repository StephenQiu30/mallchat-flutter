// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'chat_friend_apply_query_request.g.dart';

/// 好友申请查询请求
@JsonSerializable()
class ChatFriendApplyQueryRequest {
  const ChatFriendApplyQueryRequest({
    this.current,
    this.pageSize,
    this.sortField,
    this.sortOrder,
  });

  factory ChatFriendApplyQueryRequest.fromJson(Map<String, Object?> json) =>
      _$ChatFriendApplyQueryRequestFromJson(json);

  /// 当前页号
  final int? current;

  /// 页面大小
  final int? pageSize;

  /// 排序字段
  final String? sortField;

  /// 排序顺序（默认升序）
  final String? sortOrder;

  Map<String, Object?> toJson() => _$ChatFriendApplyQueryRequestToJson(this);
}

// Flutter compute serialization functions for ChatFriendApplyQueryRequest
FutureOr<ChatFriendApplyQueryRequest> deserializeChatFriendApplyQueryRequest(
  Map<String, dynamic> json,
) => ChatFriendApplyQueryRequest.fromJson(json);

FutureOr<List<ChatFriendApplyQueryRequest>>
deserializeChatFriendApplyQueryRequestList(List<Map<String, dynamic>> json) =>
    json.map((e) => ChatFriendApplyQueryRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeChatFriendApplyQueryRequest(
  ChatFriendApplyQueryRequest? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeChatFriendApplyQueryRequestList(
  List<ChatFriendApplyQueryRequest>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
