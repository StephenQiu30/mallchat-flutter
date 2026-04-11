// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

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

// Flutter compute serialization functions for OrderItem
FutureOr<OrderItem> deserializeOrderItem(Map<String, dynamic> json) =>
    OrderItem.fromJson(json);

FutureOr<List<OrderItem>> deserializeOrderItemList(List<Map<String, dynamic>> json) =>
    json.map((e) => OrderItem.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeOrderItem(OrderItem? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeOrderItemList(List<OrderItem>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
