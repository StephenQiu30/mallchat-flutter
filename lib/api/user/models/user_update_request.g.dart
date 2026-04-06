// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUpdateRequest _$UserUpdateRequestFromJson(Map<String, dynamic> json) =>
    UserUpdateRequest(
      id: (json['id'] as num?)?.toInt(),
      userName: json['userName'] as String?,
      userAvatar: json['userAvatar'] as String?,
      userProfile: json['userProfile'] as String?,
      userRole: json['userRole'] as String?,
      userPhone: json['userPhone'] as String?,
    );

Map<String, dynamic> _$UserUpdateRequestToJson(UserUpdateRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userAvatar': instance.userAvatar,
      'userProfile': instance.userProfile,
      'userRole': instance.userRole,
      'userPhone': instance.userPhone,
    };
