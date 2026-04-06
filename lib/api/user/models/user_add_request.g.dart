// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_add_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddRequest _$UserAddRequestFromJson(Map<String, dynamic> json) =>
    UserAddRequest(
      userName: json['userName'] as String?,
      userAvatar: json['userAvatar'] as String?,
      userRole: json['userRole'] as String?,
    );

Map<String, dynamic> _$UserAddRequestToJson(UserAddRequest instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userAvatar': instance.userAvatar,
      'userRole': instance.userRole,
    };
