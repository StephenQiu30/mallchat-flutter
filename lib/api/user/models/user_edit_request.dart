// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'user_edit_request.g.dart';

/// 用户编辑个人信息请求
@JsonSerializable()
class UserEditRequest {
  const UserEditRequest({
    this.userName,
    this.userAvatar,
    this.userProfile,
    this.userPhone,
    this.userEmail,
  });
  
  factory UserEditRequest.fromJson(Map<String, Object?> json) => _$UserEditRequestFromJson(json);
  
  /// 用户昵称
  final String? userName;

  /// 用户头像
  final String? userAvatar;

  /// 用户简介
  final String? userProfile;

  /// 用户电话
  final String? userPhone;

  /// 用户邮箱
  final String? userEmail;

  Map<String, Object?> toJson() => _$UserEditRequestToJson(this);
}

// Flutter compute serialization functions for UserEditRequest
FutureOr<UserEditRequest> deserializeUserEditRequest(Map<String, dynamic> json) =>
    UserEditRequest.fromJson(json);

FutureOr<List<UserEditRequest>> deserializeUserEditRequestList(List<Map<String, dynamic>> json) =>
    json.map((e) => UserEditRequest.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeUserEditRequest(UserEditRequest? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeUserEditRequestList(List<UserEditRequest>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
