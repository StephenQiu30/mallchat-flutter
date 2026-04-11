// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show compute;
import 'package:retrofit/retrofit.dart';

import '../models/api_access_log_add_request.dart';
import '../models/api_access_log_query_request.dart';
import '../models/base_response_boolean.dart';
import '../models/base_response_page_api_access_log_vo.dart';
import '../models/delete_request.dart';

part 'api_access_log_controller_client.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class ApiAccessLogControllerClient {
  factory ApiAccessLogControllerClient(Dio dio, {String? baseUrl}) =
      _ApiAccessLogControllerClient;

  /// 分页获取API访问日志列表.
  ///
  /// 分页查询API访问日志（仅管理员）.
  @POST('/log/access/list/page')
  Future<BaseResponsePageApiAccessLogVo> listLogByPage2({
    @Body() required ApiAccessLogQueryRequest body,
  });

  /// 删除API访问日志.
  ///
  /// 删除指定API访问日志（仅管理员）.
  @POST('/log/access/delete')
  Future<BaseResponseBoolean> deleteApiAccessLog({
    @Body() required DeleteRequest body,
  });

  /// 创建API访问日志.
  ///
  /// 记录API访问日志.
  @POST('/log/access/add')
  Future<BaseResponseBoolean> addApiAccessLog({
    @Body() required ApiAccessLogAddRequest body,
  });
}
