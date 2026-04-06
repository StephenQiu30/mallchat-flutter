// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageUserVo _$PageUserVoFromJson(Map<String, dynamic> json) => PageUserVo(
  records: (json['records'] as List<dynamic>?)
      ?.map((e) => UserVo.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num?)?.toInt(),
  size: (json['size'] as num?)?.toInt(),
  current: (json['current'] as num?)?.toInt(),
  orders: (json['orders'] as List<dynamic>?)
      ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  optimizeCountSql: json['optimizeCountSql'] == null
      ? null
      : PageUserVo.fromJson(json['optimizeCountSql'] as Map<String, dynamic>),
  searchCount: json['searchCount'] == null
      ? null
      : PageUserVo.fromJson(json['searchCount'] as Map<String, dynamic>),
  optimizeJoinOfCountSql: json['optimizeJoinOfCountSql'] as bool?,
  maxLimit: (json['maxLimit'] as num?)?.toInt(),
  countId: json['countId'] as String?,
  pages: (json['pages'] as num?)?.toInt(),
);

Map<String, dynamic> _$PageUserVoToJson(PageUserVo instance) =>
    <String, dynamic>{
      'records': instance.records,
      'total': instance.total,
      'size': instance.size,
      'current': instance.current,
      'orders': instance.orders,
      'optimizeCountSql': instance.optimizeCountSql,
      'searchCount': instance.searchCount,
      'optimizeJoinOfCountSql': instance.optimizeJoinOfCountSql,
      'maxLimit': instance.maxLimit,
      'countId': instance.countId,
      'pages': instance.pages,
    };
