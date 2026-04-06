// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wx_mp_check_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WxMpCheckRequest _$WxMpCheckRequestFromJson(Map<String, dynamic> json) =>
    WxMpCheckRequest(
      timestamp: json['timestamp'] as String?,
      nonce: json['nonce'] as String?,
      signature: json['signature'] as String?,
      echostr: json['echostr'] as String?,
    );

Map<String, dynamic> _$WxMpCheckRequestToJson(WxMpCheckRequest instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'nonce': instance.nonce,
      'signature': instance.signature,
      'echostr': instance.echostr,
    };
