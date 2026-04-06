// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_response_boolean.dart';
import '../models/base_response_integer.dart';
import '../models/base_response_list_long.dart';
import '../models/base_response_long.dart';
import '../models/base_response_notification_vo.dart';
import '../models/base_response_page_notification.dart';
import '../models/base_response_page_notification_vo.dart';
import '../models/delete_request.dart';
import '../models/notification_add_request.dart';
import '../models/notification_batch_delete_request.dart';
import '../models/notification_batch_read_request.dart';
import '../models/notification_query_request.dart';
import '../models/notification_read_request.dart';
import '../models/notification_update_request.dart';

part 'notification_controller_client.g.dart';

@RestApi()
abstract class NotificationControllerClient {
  factory NotificationControllerClient(Dio dio, {String? baseUrl}) = _NotificationControllerClient;

  /// 更新通知.
  ///
  /// 更新指定通知，仅管理员可用.
  @POST('/notification/update')
  Future<BaseResponseBoolean> updateNotification({
    @Body() required NotificationUpdateRequest body,
  });

  /// 标记已读.
  ///
  /// 将指定通知标记为已读状态.
  @POST('/notification/read')
  Future<BaseResponseBoolean> markNotificationRead({
    @Body() required NotificationReadRequest body,
  });

  /// 全部标记已读.
  ///
  /// 将当前用户的所有未读通知标记为已读.
  @POST('/notification/read/all')
  Future<BaseResponseBoolean> markAllNotificationRead();

  /// 获取当前用户的通知列表.
  ///
  /// 分页检索当前登录用户收到的所有通知，包含关联的用户信息。.
  @POST('/notification/my/list/page/vo')
  Future<BaseResponsePageNotificationVo> listMyNotificationVoByPage({
    @Body() required NotificationQueryRequest body,
  });

  /// 分页获取通知列表（用于同步）.
  ///
  /// 获取系统通知的完整记录分页列表，仅限管理员权限。.
  @POST('/notification/list/page')
  Future<BaseResponsePageNotification> listNotificationByPage({
    @Body() required NotificationQueryRequest body,
  });

  /// 分页获取通知列表（封装类）.
  ///
  /// 以脱敏视图形式分页获取通知列表，普通用户仅能查看自己的数据。.
  @POST('/notification/list/page/vo')
  Future<BaseResponsePageNotificationVo> listNotificationVoByPage({
    @Body() required NotificationQueryRequest body,
  });

  /// 删除通知.
  ///
  /// 删除指定通知，仅本人或管理员可操作.
  @POST('/notification/delete')
  Future<BaseResponseBoolean> deleteNotification({
    @Body() required DeleteRequest body,
  });

  /// 批量标记已读.
  ///
  /// 批量将选中通知标记为已读.
  @POST('/notification/batch/read')
  Future<BaseResponseInteger> batchMarkNotificationRead({
    @Body() required NotificationBatchReadRequest body,
  });

  /// 批量删除通知.
  ///
  /// 批量删除选中的通知.
  @POST('/notification/batch/delete')
  Future<BaseResponseInteger> batchDeleteNotification({
    @Body() required NotificationBatchDeleteRequest body,
  });

  /// 创建通知.
  ///
  /// 管理员向特定目标发送通知.
  @POST('/notification/add')
  Future<BaseResponseListLong> addNotification({
    @Body() required NotificationAddRequest body,
  });

  /// 获取未读通知数.
  ///
  /// 获取当前用户未读通知的总数.
  @GET('/notification/unread/count')
  Future<BaseResponseLong> getNotificationUnreadCount();

  /// 获取通知详情.
  ///
  /// 根据 ID 获取通知脱敏后的视图对象.
  @GET('/notification/get/vo')
  Future<BaseResponseNotificationVo> getNotificationVoById({
    @Query('id') required int id,
  });
}
