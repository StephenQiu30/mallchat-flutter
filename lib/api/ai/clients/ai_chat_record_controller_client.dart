// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show compute;
import 'package:retrofit/retrofit.dart';

import '../models/ai_chat_record_query_request.dart';
import '../models/base_response_boolean.dart';
import '../models/base_response_page_ai_chat_record_vo.dart';
import '../models/delete_request.dart';

part 'ai_chat_record_controller_client.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class AiChatRecordControllerClient {
  factory AiChatRecordControllerClient(Dio dio, {String? baseUrl}) = _AiChatRecordControllerClient;

  /// 分页获取我的对话记录.
  ///
  /// 获取当前登录用户的历史 AI 对话记录，支持分页.
  @POST('/ai/record/my/list/page/vo')
  Future<BaseResponsePageAiChatRecordVo> listMyAiChatRecordVoByPage({
    @Body() required AiChatRecordQueryRequest body,
  });

  /// 删除对话记录.
  ///
  /// 根据 ID 删除指定的对话记录，仅本人可删除.
  @POST('/ai/record/delete')
  Future<BaseResponseBoolean> deleteAiChatRecord({
    @Body() required DeleteRequest body,
  });
}
