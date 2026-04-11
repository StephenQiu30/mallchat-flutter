// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map json) =>
    $checkedCreate('OrderItem', json, ($checkedConvert) {
      final val = OrderItem(
        column: $checkedConvert('column', (v) => v as String?),
        asc: $checkedConvert('asc', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
  'column': instance.column,
  'asc': instance.asc,
};
