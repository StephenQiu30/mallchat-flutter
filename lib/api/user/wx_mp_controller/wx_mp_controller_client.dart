// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/wx_mp_check_request.dart';

part 'wx_mp_controller_client.g.dart';

@RestApi()
abstract class WxMpControllerClient {
  factory WxMpControllerClient(Dio dio, {String? baseUrl}) = _WxMpControllerClient;

  @GET('/wx/mp/')
  Future<String> check({
    @Query('request') required WxMpCheckRequest request,
  });

  @POST('/wx/mp/')
  Future<void> receiveMessage();

  @GET('/wx/mp/setMenu')
  Future<String> setMenu();
}
