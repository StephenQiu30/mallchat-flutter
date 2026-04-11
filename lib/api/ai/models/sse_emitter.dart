// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'sse_emitter.g.dart';

@JsonSerializable()
class SseEmitter {
  const SseEmitter({
    this.timeout,
  });
  
  factory SseEmitter.fromJson(Map<String, Object?> json) => _$SseEmitterFromJson(json);
  
  final int? timeout;

  Map<String, Object?> toJson() => _$SseEmitterToJson(this);
}

// Flutter compute serialization functions for SseEmitter
FutureOr<SseEmitter> deserializeSseEmitter(Map<String, dynamic> json) =>
    SseEmitter.fromJson(json);

FutureOr<List<SseEmitter>> deserializeSseEmitterList(List<Map<String, dynamic>> json) =>
    json.map((e) => SseEmitter.fromJson(e)).toList();

FutureOr<Map<String, dynamic>> serializeSseEmitter(SseEmitter? object) =>
    object?.toJson() ?? <String, dynamic>{};

FutureOr<List<Map<String, dynamic>>> serializeSseEmitterList(List<SseEmitter>? objects) =>
    objects?.map((e) => e.toJson()).toList() ?? [];
