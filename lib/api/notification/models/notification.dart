// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

/// 通知表
@JsonSerializable()
class Notification {
  const Notification({
    this.id,
    this.title,
    this.content,
    this.type,
    this.bizId,
    this.userId,
    this.relatedId,
    this.relatedType,
    this.isRead,
    this.status,
    this.contentUrl,
    this.createTime,
    this.updateTime,
    this.isDelete,
  });
  
  factory Notification.fromJson(Map<String, Object?> json) => _$NotificationFromJson(json);
  
  /// 通知ID
  final int? id;

  /// 通知标题
  final String? title;

  /// 通知内容
  final String? content;

  /// 通知类型（system-系统通知，user-用户通知，comment-评论通知，like-点赞通知，follow-关注通知，broadcast-全员广播）
  final String? type;

  /// 业务幂等ID
  final String? bizId;

  /// 接收用户ID
  final int? userId;

  /// 关联对象ID
  final int? relatedId;

  /// 关联对象类型
  final String? relatedType;

  /// 是否已读
  final int? isRead;

  /// 状态（0-正常，1-停用）
  final int? status;

  /// 跳转链接
  final String? contentUrl;

  /// 创建时间
  final DateTime? createTime;

  /// 更新时间
  final DateTime? updateTime;

  /// 是否删除
  final int? isDelete;

  Map<String, Object?> toJson() => _$NotificationToJson(this);
}
