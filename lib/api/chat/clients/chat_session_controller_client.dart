// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show compute;
import 'package:retrofit/retrofit.dart';

import '../models/base_response_boolean.dart';
import '../models/base_response_list_chat_session_vo.dart';
import '../models/delete_request.dart';

part 'chat_session_controller_client.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class ChatSessionControllerClient {
  factory ChatSessionControllerClient(Dio dio, {String? baseUrl}) = _ChatSessionControllerClient;

  /// 置顶会话.
  ///
  /// 修改会话置顶状态.
  ///
  /// [roomId] - 房间ID.
  ///
  /// [status] - 置顶状态：0-取消置顶, 1-置顶.
  @POST('/chat/session/top')
  Future<BaseResponseBoolean> topSession({
    @Query('roomId') required int roomId,
    @Query('status') required int status,
  });

  /// 删除会话.
  ///
  /// 在列表中移除选中的会话.
  @POST('/chat/session/delete')
  Future<BaseResponseBoolean> deleteSession({
    @Body() required DeleteRequest body,
  });

  /// 用户消息列表.
  ///
  /// 获取当前登录用户的所有消息会话列表（包含未读数、最后一条消息概览）.
  @GET('/chat/session/list/vo')
  Future<BaseResponseListChatSessionVo> listMySessions();
}
