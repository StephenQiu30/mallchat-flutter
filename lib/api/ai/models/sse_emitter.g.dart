// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sse_emitter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SseEmitter _$SseEmitterFromJson(Map json) =>
    $checkedCreate('SseEmitter', json, ($checkedConvert) {
      final val = SseEmitter(
        timeout: $checkedConvert('timeout', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$SseEmitterToJson(SseEmitter instance) =>
    <String, dynamic>{'timeout': instance.timeout};
