import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:mallchat_flutter/store/app_store.dart';
import 'package:mallchat_flutter/store/chat_store.dart';
import 'package:mallchat_flutter/api/user/user_client.dart';
import 'package:mallchat_flutter/api/ai/ai_client.dart';
import 'package:mallchat_flutter/api/file/file_client.dart';
import 'package:mallchat_flutter/api/notification/notification_client.dart';
import 'package:mallchat_flutter/api/log/log_client.dart';

/// A centralized Request client for MallChat, inspired by umi-openapi/request.
/// All microservices are accessed through the Gateway (port 8080).
class Request {
  static Dio? _instance;

  static const String gatewayUrl = 'http://localhost:8080/api';

  static Dio getInstance() {
    if (_instance == null) {
      _instance = Dio(
        BaseOptions(
          baseUrl: gatewayUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      // Add Interceptors
      _instance!.interceptors.addAll([
        _RequestInterceptor(),
        _ResponseInterceptor(),
        _ErrorInterceptor(),
      ]);
    }
    return _instance!;
  }

  // --- 聚合模块入口 (Fat Service 模式) ---
  
  /// 全局应用状态 (含 Token、导航与系统逻辑)
  static AppStore get app => Get.find<AppStore>();

  /// 聊天功能模块 (集成 API 与响应式消息状态)
  static ChatStore get chat => Get.find<ChatStore>();

  // --- 基础 API 客户端 (供内部或特殊场景调用) ---
  static UserClient get user => UserClient(getInstance());
  static AiClient get ai => AiClient(getInstance());
  static FileClient get file => FileClient(getInstance());
  static NotificationClient get notification => NotificationClient(getInstance());
  static LogClient get log => LogClient(getInstance());
}

class _RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 打印请求日志 (类似 Axios process.env.NODE_ENV === 'development')
    debugPrint('[API Request] ${options.method.toUpperCase()} ${options.baseUrl}${options.path}');

    // 处理 Form 类型 (类似 Axios requestType === 'form')
    if (options.extra['requestType'] == 'form') {
      options.headers['Content-Type'] = 'multipart/form-data';
    }

    // 自动注入 Token (类似 Axios localStorage.getItem('token'))
    final prefs = Get.find<SharedPreferences>();
    final String? token = prefs.getString('token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    
    handler.next(options);
  }
}

class _ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 类似 Axios response => response.data
    // 如果后端返回了包装层且包含成功标识，可以在此进一步剥离
    // 目前保持 Dio 默认的 data 返回
    handler.next(response);
  }
}

class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;
    final status = response?.statusCode;

    // 处理鉴权失效 (类似 Axios status === 401 || status === 403)
    if (status == 401 || status == 403) {
      Get.find<SharedPreferences>().remove('token');
      // 发送全局通知或重定向（此处预留，类似于 window.dispatchEvent）
      debugPrint('[API Error] Auth invalid, token cleared.');
    }

    // 错误消息反馈 (类似 Axios toast.error)
    String? message;
    if (response?.data is Map) {
      message = response?.data['message'];
    }
    message ??= err.message ?? 'Unknown error occurred';

    // 使用 TDesign Toast 展示错误
    TDToast.showFail(message, context: Get.context!);

    handler.next(err);
  }
}
