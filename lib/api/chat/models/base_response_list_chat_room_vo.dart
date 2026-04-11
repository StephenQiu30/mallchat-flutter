// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import 'chat_room_vo.dart';

part 'base_response_list_chat_room_vo.g.dart';

/// 通用返回类
@JsonSerializable()
class BaseResponseListChatRoomVo {
  const BaseResponseListChatRoomVo({this.code, this.data, this.message});

  factory BaseResponseListChatRoomVo.fromJson(Map<String, Object?> json) =>
      _$BaseResponseListChatRoomVoFromJson(json);

  /// 状态码
  final int? code;

  /// 数据
  final List<ChatRoomVo>? data;

  /// 消息
  final String? message;

  Map<String, Object?> toJson() => _$BaseResponseListChatRoomVoToJson(this);
}

// Flutter compute serialization functions for BaseResponseListChatRoomVo
FutureOr<BaseResponseListChatRoomVo> deserializeBaseResponseListChatRoomVo(
  Map<String, dynamic> json,
) => BaseResponseListChatRoomVo.fromJson(json);

FutureOr<List<BaseResponseListChatRoomVo>>
deserializeBaseResponseListChatRoomVoList(List<Map<String, dynamic>> json) =>
    json.map((e) => BaseResponseListChatRoomVo.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeBaseResponseListChatRoomVo(
  BaseResponseListChatRoomVo? object,
) => object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeBaseResponseListChatRoomVoList(
  List<BaseResponseListChatRoomVo>? objects,
) => objects?.map((e) => e.toJson()).toList() ?? [];
