// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/ai_chat_request.dart';
import '../models/base_response_ai_chat_response.dart';
import '../models/base_response_list_ai_model_vo.dart';
import '../models/sse_emitter.dart';

part 'ai_chat_controller_client.g.dart';

@RestApi()
abstract class AiChatControllerClient {
  factory AiChatControllerClient(Dio dio, {String? baseUrl}) = _AiChatControllerClient;

  /// AI 对话 (标准).
  ///
  /// 发送消息并等待 AI 返回完整回答.
  @POST('/ai/chat')
  Future<BaseResponseAiChatResponse> doAiChat({
    @Body() required AiChatRequest body,
  });

  /// AI 对话 (流式).
  ///
  /// 发送消息并通过 SSE 获取 AI 逐字返回的内容.
  @POST('/ai/chat/stream')
  Future<SseEmitter> doStreamAiChat({
    @Body() required AiChatRequest body,
  });

  /// 获取支持的模型列表.
  ///
  /// 获取系统当前支持的所有 AI 模型及其描述.
  @GET('/ai/models')
  Future<BaseResponseListAiModelVo> listModels();
}
