// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'user_vo.dart';

part 'notification_vo.g.dart';

/// 通知视图对象
@JsonSerializable()
class NotificationVo {
  const NotificationVo({
    this.id,
    this.title,
    this.content,
    this.type,
    this.userId,
    this.userVo,
    this.relatedId,
    this.relatedType,
    this.isRead,
    this.status,
    this.contentUrl,
    this.bizId,
    this.createTime,
    this.updateTime,
  });
  
  factory NotificationVo.fromJson(Map<String, Object?> json) => _$NotificationVoFromJson(json);
  
  /// 通知ID
  final int? id;

  /// 通知标题
  final String? title;

  /// 通知内容
  final String? content;

  /// 通知类型
  final String? type;

  /// 接收用户ID
  final int? userId;
  @JsonKey(name: 'userVO')
  final UserVo? userVo;

  /// 关联对象ID
  final int? relatedId;

  /// 关联对象类型
  final String? relatedType;

  /// 是否已读
  final int? isRead;

  /// 状态
  final int? status;

  /// 跳转链接
  final String? contentUrl;

  /// 业务幂等ID
  final String? bizId;

  /// 创建时间
  final DateTime? createTime;

  /// 更新时间
  final DateTime? updateTime;

  Map<String, Object?> toJson() => _$NotificationVoToJson(this);
}
