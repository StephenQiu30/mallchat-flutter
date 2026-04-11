// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'chat_friend_apply_vo.dart';
import 'order_item.dart';
import 'page_chat_friend_apply_vo.dart';

part 'page_chat_friend_apply_vo.g.dart';

/// 数据
@JsonSerializable()
class PageChatFriendApplyVo {
  const PageChatFriendApplyVo({
    this.records,
    this.total,
    this.size,
    this.current,
    this.orders,
    this.optimizeCountSql,
    this.searchCount,
    this.optimizeJoinOfCountSql,
    this.maxLimit,
    this.countId,
    this.pages,
  });
  
  factory PageChatFriendApplyVo.fromJson(Map<String, Object?> json) => _$PageChatFriendApplyVoFromJson(json);
  
  final List<ChatFriendApplyVo>? records;
  final int? total;
  final int? size;
  final int? current;
  final List<OrderItem>? orders;
  final PageChatFriendApplyVo? optimizeCountSql;
  final PageChatFriendApplyVo? searchCount;
  final bool? optimizeJoinOfCountSql;
  final int? maxLimit;
  final String? countId;
  final int? pages;

  Map<String, Object?> toJson() => _$PageChatFriendApplyVoToJson(this);
}

// Flutter compute serialization functions for PageChatFriendApplyVo
FutureOr<PageChatFriendApplyVo> deserializePageChatFriendApplyVo(Map<String, dynamic> json) =>
    PageChatFriendApplyVo.fromJson(json);

FutureOr<List<PageChatFriendApplyVo>> deserializePageChatFriendApplyVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => PageChatFriendApplyVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializePageChatFriendApplyVo(PageChatFriendApplyVo? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializePageChatFriendApplyVoList(List<PageChatFriendApplyVo>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
