// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_response_boolean.dart';
import '../models/base_response_list_chat_message_vo.dart';
import '../models/base_response_list_chat_room_vo.dart';
import '../models/base_response_long.dart';
import '../models/chat_message_send_request.dart';
import '../models/chat_room_add_request.dart';

part 'chat_room_controller_client.g.dart';

@RestApi()
abstract class ChatRoomControllerClient {
  factory ChatRoomControllerClient(Dio dio, {String? baseUrl}) = _ChatRoomControllerClient;

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
  /// 创建一个新的聊天室（群聊或私聊）.
  @POST('/chat/room/add')
  Future<BaseResponseLong> addChatRoom({
    @Body() required ChatRoomAddRequest body,
  });

  /// 发送消息.
  ///
  /// 向指定房间发送一条消息（支持文本、图片、文件）.
  @POST('/chat/message/send')
  Future<BaseResponseLong> sendMessage({
    @Body() required ChatMessageSendRequest body,
  });

  /// 获取当前用户的聊天室列表.
  ///
  /// 获取当前登录用户参与的所有聊天室.
  @GET('/chat/room/list')
  Future<BaseResponseListChatRoomVo> listUserChatRooms();

  /// 获取历史消息.
  ///
  /// 获取指定房间的历史聊天记录（支持滚动翻页优化）.
  ///
  /// [roomId] - 房间ID.
  ///
  /// [lastMessageId] - 上一页最后一条消息ID.
  ///
  /// [limit] - 加载消息数量.
  @GET('/chat/message/history')
  Future<BaseResponseListChatMessageVo> listHistoryMessages({
    @Query('roomId') required int roomId,
    @Query('limit') int? limit = 20,
    @Query('lastMessageId') int? lastMessageId,
  });
}
