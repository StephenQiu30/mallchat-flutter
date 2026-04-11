// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show compute;
import 'package:retrofit/retrofit.dart';

import '../models/ai_chat_request.dart';
import '../models/base_response_ai_chat_response.dart';
import '../models/base_response_list_ai_model_vo.dart';
import '../models/sse_emitter.dart';

part 'ai_chat_controller_client.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class AiChatControllerClient {
  factory AiChatControllerClient(Dio dio, {String? baseUrl}) =
      _AiChatControllerClient;

  /// AI 对话 (标准).
  ///
  /// 发送问题并同步等待 AI 完整的文本回复.
  @POST('/ai/chat')
  Future<BaseResponseAiChatResponse> doAiChat({
    @Body() required AiChatRequest body,
  });

  /// AI 对话 (流式).
  ///
  /// 发送问题并通过 SSE 获取 AI 实时、逐字下发的回答内容.
  @POST('/ai/chat/stream')
  Future<SseEmitter> doStreamAiChat({@Body() required AiChatRequest body});

  /// 获取支持的模型列表.
  ///
  /// 获取系统当前支持的所有 AI 模型及其描述.
  @GET('/ai/models')
  Future<BaseResponseListAiModelVo> listModels();
}
