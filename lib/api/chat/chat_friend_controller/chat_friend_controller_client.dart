// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_response_boolean.dart';
import '../models/base_response_list_chat_friend_user_vo.dart';
import '../models/chat_friend_add_request.dart';

part 'chat_friend_controller_client.g.dart';

@RestApi()
abstract class ChatFriendControllerClient {
  factory ChatFriendControllerClient(Dio dio, {String? baseUrl}) = _ChatFriendControllerClient;

  /// 添加好友.
  ///
  /// 与指定用户建立好友关系.
  @POST('/chat_friend/add')
  Future<BaseResponseBoolean> addFriend({
    @Body() required ChatFriendAddRequest body,
  });

  /// 好友列表.
  ///
  /// 获取当前用户的好友简要信息.
  @GET('/chat_friend/list/vo')
  Future<BaseResponseListChatFriendUserVo> listFriends();
}
