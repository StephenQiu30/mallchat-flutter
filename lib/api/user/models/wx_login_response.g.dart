// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wx_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WxLoginResponse _$WxLoginResponseFromJson(Map<String, dynamic> json) =>
    WxLoginResponse(
      qrCodeUrl: json['qrCodeUrl'] as String?,
      sceneId: json['sceneId'] as String?,
    );

Map<String, dynamic> _$WxLoginResponseToJson(WxLoginResponse instance) =>
    <String, dynamic>{
      'qrCodeUrl': instance.qrCodeUrl,
      'sceneId': instance.sceneId,
    };
