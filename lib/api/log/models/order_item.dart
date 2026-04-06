// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'order_item.g.dart';

@JsonSerializable()
class OrderItem {
  const OrderItem({
    this.column,
    this.asc,
  });
  
  factory OrderItem.fromJson(Map<String, Object?> json) => _$OrderItemFromJson(json);
  
  final String? column;
  final bool? asc;

  Map<String, Object?> toJson() => _$OrderItemToJson(this);
}
