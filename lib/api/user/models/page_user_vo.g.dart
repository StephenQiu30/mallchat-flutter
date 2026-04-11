// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageUserVo _$PageUserVoFromJson(Map json) =>
    $checkedCreate('PageUserVo', json, ($checkedConvert) {
      final val = PageUserVo(
        records: $checkedConvert(
          'records',
          (v) => (v as List<dynamic>?)
              ?.map((e) => UserVo.fromJson(Map<String, Object?>.from(e as Map)))
              .toList(),
        ),
        total: $checkedConvert('total', (v) => (v as num?)?.toInt()),
        size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
        current: $checkedConvert('current', (v) => (v as num?)?.toInt()),
        orders: $checkedConvert(
          'orders',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => OrderItem.fromJson(Map<String, Object?>.from(e as Map)),
              )
              .toList(),
        ),
        optimizeCountSql: $checkedConvert(
          'optimizeCountSql',
          (v) => v == null
              ? null
              : PageUserVo.fromJson(Map<String, Object?>.from(v as Map)),
        ),
        searchCount: $checkedConvert(
          'searchCount',
          (v) => v == null
              ? null
              : PageUserVo.fromJson(Map<String, Object?>.from(v as Map)),
        ),
        optimizeJoinOfCountSql: $checkedConvert(
          'optimizeJoinOfCountSql',
          (v) => v as bool?,
        ),
        maxLimit: $checkedConvert('maxLimit', (v) => (v as num?)?.toInt()),
        countId: $checkedConvert('countId', (v) => v as String?),
        pages: $checkedConvert('pages', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$PageUserVoToJson(PageUserVo instance) =>
    <String, dynamic>{
      'records': instance.records?.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'size': instance.size,
      'current': instance.current,
      'orders': instance.orders?.map((e) => e.toJson()).toList(),
      'optimizeCountSql': instance.optimizeCountSql?.toJson(),
      'searchCount': instance.searchCount?.toJson(),
      'optimizeJoinOfCountSql': instance.optimizeJoinOfCountSql,
      'maxLimit': instance.maxLimit,
      'countId': instance.countId,
      'pages': instance.pages,
    };
