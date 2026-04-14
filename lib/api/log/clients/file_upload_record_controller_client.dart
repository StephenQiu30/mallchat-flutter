// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show compute;
import 'package:retrofit/retrofit.dart';

import '../models/base_response_boolean.dart';
import '../models/base_response_page_file_upload_record_vo.dart';
import '../models/delete_request.dart';
import '../models/file_upload_record_add_request.dart';
import '../models/file_upload_record_query_request.dart';

part 'file_upload_record_controller_client.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class FileUploadRecordControllerClient {
  factory FileUploadRecordControllerClient(Dio dio, {String? baseUrl}) =
      _FileUploadRecordControllerClient;

  /// 分页获取文件上传记录列表.
  ///
  /// 分页查询文件上传记录（仅管理员）.
  @POST('/log/file/upload/list/page')
  Future<BaseResponsePageFileUploadRecordVo> listRecordByPage({
    @Body() required FileUploadRecordQueryRequest body,
  });

  /// 删除文件上传记录.
  ///
  /// 删除指定文件上传记录（仅管理员）.
  @POST('/log/file/upload/delete')
  Future<BaseResponseBoolean> deleteFileUploadRecord({
    @Body() required DeleteRequest body,
  });

  /// 创建文件上传记录.
  ///
  /// 记录文件上传信息.
  @POST('/log/file/upload/add')
  Future<BaseResponseBoolean> addFileUploadRecord({
    @Body() required FileUploadRecordAddRequest body,
  });
}
