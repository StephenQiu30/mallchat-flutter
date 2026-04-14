// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'chat_friend_user_vo.dart';

part 'base_response_list_chat_friend_user_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseListChatFriendUserVo {
  const BaseResponseListChatFriendUserVo({this.code, this.data, this.message});

  factory BaseResponseListChatFriendUserVo.fromJson(
    Map<String, Object?> json,
  ) => _$BaseResponseListChatFriendUserVoFromJson(json);

  /// 状态码
  final int? code;

  /// 数据
  final List<ChatFriendUserVo>? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() =>
      _$BaseResponseListChatFriendUserVoToJson(this);
}

// Flutter compute serialization functions for BaseResponseListChatFriendUserVo
FutureOr<BaseResponseListChatFriendUserVo>
deserializeBaseResponseListChatFriendUserVo(Map<String, dynamic> json) =>
    BaseResponseListChatFriendUserVo.fromJson(json);

FutureOr<List<BaseResponseListChatFriendUserVo>>
deserializeBaseResponseListChatFriendUserVoList(
  List<Map<String, dynamic>> json,
) => json.map((e) => BaseResponseListChatFriendUserVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponseListChatFriendUserVo(
  BaseResponseListChatFriendUserVo? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>>
serializeBaseResponseListChatFriendUserVoList(
  List<BaseResponseListChatFriendUserVo>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
