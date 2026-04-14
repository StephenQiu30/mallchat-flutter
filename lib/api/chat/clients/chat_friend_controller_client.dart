// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show compute;
import 'package:retrofit/retrofit.dart';

import '../models/base_response_boolean.dart';
import '../models/base_response_list_chat_friend_user_vo.dart';
import '../models/chat_friend_add_request.dart';

part 'chat_friend_controller_client.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class ChatFriendControllerClient {
  factory ChatFriendControllerClient(Dio dio, {String? baseUrl}) =
      _ChatFriendControllerClient;

  /// 直接添加好友.
  ///
  /// 跳过申请直接与指定用户建立双向好友关系（通常用于系统加好友或测试）.
  @POST('/chat/friend/add')
  Future<BaseResponseBoolean> addFriend({
    @Body() required ChatFriendAddRequest body,
  });

  /// 我的好友列表.
  ///
  /// 获取当前登录用户的所有好友基本信息（昵称、头像）.
  @GET('/chat/friend/list/vo')
  Future<BaseResponseListChatFriendUserVo> listFriends();
}
