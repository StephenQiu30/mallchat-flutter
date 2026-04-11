// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'chat_friend_user_vo.g.dart';

/// 好友用户简要信息
@JsonSerializable()
class ChatFriendUserVo {
  const ChatFriendUserVo({this.id, this.userName, this.userAvatar});

  factory ChatFriendUserVo.fromJson(Map<String, Object?> json) =>
      _$ChatFriendUserVoFromJson(json);

  /// 用户ID
  final int? id;

  /// 昵称
  final String? userName;

  /// 头像
  final String? userAvatar;

  Map<String, Object?> toJson() => _$ChatFriendUserVoToJson(this);
}

// Flutter compute serialization functions for ChatFriendUserVo
FutureOr<ChatFriendUserVo> deserializeChatFriendUserVo(
  Map<String, dynamic> json,
) => ChatFriendUserVo.fromJson(json);

FutureOr<List<ChatFriendUserVo>> deserializeChatFriendUserVoList(
  List<Map<String, dynamic>> json,
) => json.map((e) => ChatFriendUserVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeChatFriendUserVo(
  ChatFriendUserVo? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeChatFriendUserVoList(
  List<ChatFriendUserVo>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
