import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mallchat_flutter/api/request.dart';

/// 文件上传服务
///
/// 封装图片/文件上传逻辑，使用 Dio multipart 上传
class UploadService {
  const UploadService._();

  /// 上传图片到聊天
  ///
  /// [filePath] 本地图片路径
  /// 返回上传后的图片 URL，失败返回 null
  static Future<String?> uploadImage(String filePath) async {
    return _uploadFile(filePath, 'chat_image');
  }

  /// 上传用户头像
  static Future<String?> uploadAvatar(String filePath) async {
    return _uploadFile(filePath, 'user_avatar');
  }

  /// 上传聊天文件
  static Future<String?> uploadFile(String filePath) async {
    return _uploadFile(filePath, 'chat_file');
  }

  /// 通用文件上传
  ///
  /// [filePath] 本地文件路径
  /// [bizType] 业务类型: user_avatar / chat_image / chat_file
  /// 返回文件 URL，失败返回 null
  static Future<String?> _uploadFile(String filePath, String bizType) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        debugPrint('[UploadService] File not found: $filePath');
        return null;
      }

      final fileName = filePath.split('/').last;
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath, filename: fileName),
      });

      final dio = Request.instance.dio;
      final response = await dio.post(
        '/file/upload',
        data: formData,
        queryParameters: {'bizType': bizType},
        options: Options(contentType: 'multipart/form-data'),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map<String, dynamic> && data['code'] == 0) {
          final fileData = data['data'];
          if (fileData is Map<String, dynamic>) {
            return fileData['url'] as String?;
          }
        }
      }

      debugPrint('[UploadService] Upload failed: ${response.statusCode}');
      return null;
    } catch (e) {
      debugPrint('[UploadService] Upload error: $e');
      return null;
    }
  }
}
