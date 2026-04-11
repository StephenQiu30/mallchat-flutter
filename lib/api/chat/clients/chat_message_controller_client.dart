// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show compute;
import 'package:retrofit/retrofit.dart';

import '../models/base_response_boolean.dart';
import '../models/base_response_list_chat_message_vo.dart';
import '../models/base_response_long.dart';
import '../models/chat_message_read_request.dart';
import '../models/chat_message_send_request.dart';
import '../models/delete_request.dart';

part 'chat_message_controller_client.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class ChatMessageControllerClient {
  factory ChatMessageControllerClient(Dio dio, {String? baseUrl}) = _ChatMessageControllerClient;

  /// 发送消息.
  ///
  /// 向指定房间发送一条消息（支持文本、图片、文件）.
  @POST('/chat/message/send')
  Future<BaseResponseLong> sendMessage({
    @Body() required ChatMessageSendRequest body,
  });

  /// 撤回消息.
  ///
  /// 撤回指定消息（限时 2 分钟内）.
  @POST('/chat/message/recall')
  Future<BaseResponseBoolean> recallMessage({
    @Body() required DeleteRequest body,
  });

  /// 上报消息已读.
  ///
  /// 更新当前用户在该房间的已读消息 ID.
  @POST('/chat/message/read')
  Future<BaseResponseBoolean> markMessageRead({
    @Body() required ChatMessageReadRequest body,
  });

  /// 获取历史消息.
  ///
  /// 获取指定房间的历史聊天记录（支持滚动翻页优化）.
  ///
  /// [roomId] - 房间ID.
  ///
  /// [lastMessageId] - 上一页最后一条消息ID.
  ///
  /// [limit] - 加载消息数量.
  @GET('/chat/message/list/history/vo')
  Future<BaseResponseListChatMessageVo> listHistoryMessages({
    @Query('roomId') required int roomId,
    @Query('limit') int? limit = 20,
    @Query('lastMessageId') int? lastMessageId,
  });
}
