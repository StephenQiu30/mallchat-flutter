// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'user_query_request.g.dart';

/// 用户查询请求
@JsonSerializable()
class UserQueryRequest {
  const UserQueryRequest({
    this.current,
    this.pageSize,
    this.sortField,
    this.sortOrder,
    this.id,
    this.notId,
    this.wxUnionId,
    this.mpOpenId,
    this.userName,
    this.userRole,
    this.userPhone,
    this.searchText,
  });
  
  factory UserQueryRequest.fromJson(Map<String, Object?> json) => _$UserQueryRequestFromJson(json);
  
  /// 当前页号
  final int? current;

  /// 页面大小
  final int? pageSize;

  /// 排序字段
  final String? sortField;

  /// 排序方式
  final String? sortOrder;

  /// 用户ID
  final int? id;

  /// 排除的用户ID
  final int? notId;

  /// 微信开放平台UnionID
  final String? wxUnionId;

  /// 公众号OpenID
  final String? mpOpenId;

  /// 用户昵称
  final String? userName;

  /// 用户角色
  final String? userRole;

  /// 用户电话
  final String? userPhone;

  /// 搜索文本
  final String? searchText;

  Map<String, Object?> toJson() => _$UserQueryRequestToJson(this);
}
