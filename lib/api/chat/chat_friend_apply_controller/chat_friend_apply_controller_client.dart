// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_response_boolean.dart';
import '../models/base_response_long.dart';
import '../models/base_response_page_chat_friend_apply_vo.dart';
import '../models/chat_friend_apply_request.dart';
import '../models/chat_friend_approve_request.dart';

part 'chat_friend_apply_controller_client.g.dart';

@RestApi()
abstract class ChatFriendApplyControllerClient {
  factory ChatFriendApplyControllerClient(Dio dio, {String? baseUrl}) = _ChatFriendApplyControllerClient;

  /// 审核好友.
  ///
  /// 同意或拒绝好友申请.
  @POST('/chat_friend_apply/approve')
  Future<BaseResponseBoolean> approveFriend({
    @Body() required ChatFriendApproveRequest body,
  });

  /// 申请好友.
  ///
  /// 发起好友添加申请.
  @POST('/chat_friend_apply/add')
  Future<BaseResponseLong> applyFriend({
    @Body() required ChatFriendApplyRequest body,
  });

  /// 好友申请列表.
  ///
  /// 获取当前收到的好友申请记录.
  @GET('/chat_friend_apply/list/vo')
  Future<BaseResponsePageChatFriendApplyVo> listFriendApply({
    @Query('current') int? current = 1,
    @Query('size') int? size = 10,
  });
}
