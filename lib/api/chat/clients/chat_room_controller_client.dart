// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show compute;
import 'package:retrofit/retrofit.dart';

import '../models/base_response_boolean.dart';
import '../models/base_response_list_chat_room_vo.dart';
import '../models/base_response_long.dart';
import '../models/chat_private_room_request.dart';
import '../models/chat_room_add_request.dart';

part 'chat_room_controller_client.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class ChatRoomControllerClient {
  factory ChatRoomControllerClient(Dio dio, {String? baseUrl}) =
      _ChatRoomControllerClient;

  /// 获取或创建私聊房间.
  ///
  /// 获取与指定好友的唯一私聊房间，若不存在则初始化（UnionID 级别唯一）.
  @POST('/chat/room/private')
  Future<BaseResponseLong> getOrCreatePrivateRoom({
    @Body() required ChatPrivateRoomRequest body,
  });

  /// 加入聊天室.
  ///
  /// 将当前用户加入到指定的聊天室.
  ///
  /// [roomId] - 房间ID.
  @POST('/chat/room/join')
  Future<BaseResponseBoolean> joinChatRoom({
    @Query('roomId') required int roomId,
  });

  /// 创建聊天室.
  ///
  /// 创建一个新的聊天室（群聊或私聊会话）.
  @POST('/chat/room/add')
  Future<BaseResponseLong> addChatRoom({
    @Body() required ChatRoomAddRequest body,
  });

  /// 获取当前用户的聊天室列表.
  ///
  /// 获取当前登录用户参与的所有聊天室.
  @GET('/chat/room/list/vo')
  Future<BaseResponseListChatRoomVo> listUserChatRooms();
}
