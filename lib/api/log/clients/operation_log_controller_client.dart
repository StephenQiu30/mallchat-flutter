// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show compute;
import 'package:retrofit/retrofit.dart';

import '../models/base_response_boolean.dart';
import '../models/base_response_page_operation_log_vo.dart';
import '../models/delete_request.dart';
import '../models/operation_log_add_request.dart';
import '../models/operation_log_query_request.dart';

part 'operation_log_controller_client.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class OperationLogControllerClient {
  factory OperationLogControllerClient(Dio dio, {String? baseUrl}) = _OperationLogControllerClient;

  /// 分页获取操作日志列表.
  ///
  /// 分页查询操作日志（仅管理员）.
  @POST('/log/operation/list/page')
  Future<BaseResponsePageOperationLogVo> listLogByPage({
    @Body() required OperationLogQueryRequest body,
  });

  /// 删除操作日志.
  ///
  /// 删除指定操作日志（仅管理员）.
  @POST('/log/operation/delete')
  Future<BaseResponseBoolean> deleteOperationLog({
    @Body() required DeleteRequest body,
  });

  /// 创建操作日志.
  ///
  /// 记录用户操作日志.
  @POST('/log/operation/add')
  Future<BaseResponseBoolean> addOperationLog({
    @Body() required OperationLogAddRequest body,
  });
}
