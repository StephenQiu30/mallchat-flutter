// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show compute;
import 'package:retrofit/retrofit.dart';

import '../models/base_response_boolean.dart';
import '../models/base_response_long.dart';
import '../models/base_response_page_chat_friend_apply_vo.dart';
import '../models/chat_friend_apply_query_request.dart';
import '../models/chat_friend_apply_request.dart';
import '../models/chat_friend_approve_request.dart';

part 'chat_friend_apply_controller_client.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class ChatFriendApplyControllerClient {
  factory ChatFriendApplyControllerClient(Dio dio, {String? baseUrl}) = _ChatFriendApplyControllerClient;

  /// 好友申请列表.
  ///
  /// 获取当前收到的好友申请记录.
  @POST('/chat/friend/apply/list/page/vo')
  Future<BaseResponsePageChatFriendApplyVo> listFriendApply({
    @Body() required ChatFriendApplyQueryRequest body,
  });

  /// 审核好友.
  ///
  /// 同意或拒绝好友申请，同意后将自动建立双向好友关系并创建私聊房间.
  @POST('/chat/friend/apply/approve')
  Future<BaseResponseBoolean> approveFriend({
    @Body() required ChatFriendApproveRequest body,
  });

  /// 申请好友.
  ///
  /// 向目标用户发起好友添加申请.
  @POST('/chat/friend/apply/add')
  Future<BaseResponseLong> applyFriend({
    @Body() required ChatFriendApplyRequest body,
  });
}
