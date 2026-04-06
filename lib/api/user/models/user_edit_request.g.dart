// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_edit_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEditRequest _$UserEditRequestFromJson(Map<String, dynamic> json) =>
    UserEditRequest(
      userName: json['userName'] as String?,
      userAvatar: json['userAvatar'] as String?,
      userProfile: json['userProfile'] as String?,
      userPhone: json['userPhone'] as String?,
    );

Map<String, dynamic> _$UserEditRequestToJson(UserEditRequest instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userAvatar': instance.userAvatar,
      'userProfile': instance.userProfile,
      'userPhone': instance.userPhone,
    };
