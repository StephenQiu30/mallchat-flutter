// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show compute;
import 'package:retrofit/retrofit.dart';

import '../models/base_response_file_vo.dart';
import '../models/file_upload_request_body.dart';

part 'file_controller_client.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class FileControllerClient {
  factory FileControllerClient(Dio dio, {String? baseUrl}) = _FileControllerClient;

  /// 上传文件.
  ///
  /// 上传文件到腾讯云 COS，支持用户头像、聊天图片、聊天文件等业务类型.
  ///
  /// [bizType] - 业务类型：user_avatar(用户头像)、chat_image(聊天图片)、chat_file(聊天文件).
  @POST('/file/upload')
  Future<BaseResponseFileVo> uploadFile({
    @Query('bizType') required String bizType,
    @Body() FileUploadRequestBody? body,
  });
}
