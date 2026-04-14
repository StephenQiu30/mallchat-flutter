// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';

import 'clients/file_controller_client.dart';

/// OpenAPI definition `vv0`
class FileClient {
  FileClient(Dio dio, {String? baseUrl}) : _dio = dio, _baseUrl = baseUrl;

  final Dio _dio;
  final String? _baseUrl;

  static String get version => 'v0';

  FileControllerClient? _fileController;

  FileControllerClient get fileController =>
      _fileController ??= FileControllerClient(_dio, baseUrl: _baseUrl);
}
