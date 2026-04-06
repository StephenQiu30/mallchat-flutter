// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_response_file_vo.dart';
import '../models/file_upload_request_body.dart';

part 'file_controller_client.g.dart';

@RestApi()
abstract class FileControllerClient {
  factory FileControllerClient(Dio dio, {String? baseUrl}) = _FileControllerClient;

  /// 上传文件.
  ///
  /// 上传文件到 COS.
  @POST('/file/upload')
  Future<BaseResponseFileVo> uploadFile({
    @Query('bizType') required String bizType,
    @Body() FileUploadRequestBody? body,
  });
}
