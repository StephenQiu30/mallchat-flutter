// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_file_upload_record_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageFileUploadRecordVo _$PageFileUploadRecordVoFromJson(
  Map<String, dynamic> json,
) => PageFileUploadRecordVo(
  records: (json['records'] as List<dynamic>?)
      ?.map((e) => FileUploadRecordVo.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num?)?.toInt(),
  size: (json['size'] as num?)?.toInt(),
  current: (json['current'] as num?)?.toInt(),
  orders: (json['orders'] as List<dynamic>?)
      ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  optimizeCountSql: json['optimizeCountSql'] == null
      ? null
      : PageFileUploadRecordVo.fromJson(
          json['optimizeCountSql'] as Map<String, dynamic>,
        ),
  searchCount: json['searchCount'] == null
      ? null
      : PageFileUploadRecordVo.fromJson(
          json['searchCount'] as Map<String, dynamic>,
        ),
  optimizeJoinOfCountSql: json['optimizeJoinOfCountSql'] as bool?,
  maxLimit: (json['maxLimit'] as num?)?.toInt(),
  countId: json['countId'] as String?,
  pages: (json['pages'] as num?)?.toInt(),
);

Map<String, dynamic> _$PageFileUploadRecordVoToJson(
  PageFileUploadRecordVo instance,
) => <String, dynamic>{
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
