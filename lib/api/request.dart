import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response; // Avoid conflict with Dio Response
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mallchat_flutter/store/app_store.dart';
import 'package:mallchat_flutter/store/chat_store.dart';
import 'package:mallchat_flutter/store/contact_store.dart';

// Clients imports
import 'package:mallchat_flutter/api/user/user_client.dart';
import 'package:mallchat_flutter/api/file/file_client.dart';
import 'package:mallchat_flutter/api/notification/notification_client.dart';
import 'package:mallchat_flutter/api/log/log_client.dart';
import 'package:mallchat_flutter/api/ai/ai_client.dart';
import 'package:mallchat_flutter/api/chat/chat_client.dart';

/// 极简 API 请求服务
/// 类似于 umi-openapi 的风格，封装核心 Dio 实例并提供各模块 Client。
class Request {
  static final Request instance = Request._internal();
  late final Dio dio;

  factory Request() => instance;

  Request._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:8080/api', // 网关地址
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    // 仅添加最基础的请求/响应日志，不再过度设计拦截器业务
    dio.interceptors.add(_LogInterceptor());
  }

  // --- 数据存储 (Stores) ---
  static AppStore get app => Get.find<AppStore>();
  static ChatStore get chat => Get.find<ChatStore>();
  static ContactStore get contact => Get.find<ContactStore>();

  // --- API 客户端 (Clients) ---
  static UserClient get userClient => UserClient(instance.dio);
  static FileClient get fileClient => FileClient(instance.dio);
  static NotificationClient get notificationClient =>
      NotificationClient(instance.dio);
  static LogClient get logClient => LogClient(instance.dio);
  static AiClient get aiClient => AiClient(instance.dio);
  static ChatClient get chatClient => ChatClient(instance.dio);
}

class _LogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 注入 Token
    final prefs = Get.find<SharedPreferences>();
    final token = prefs.getString('token');
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    debugPrint('[API Request] ${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      '[API Response] ${response.statusCode} from ${response.requestOptions.uri}',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('[API Error] ${err.message}');
    if (err.response?.statusCode == 401 && Get.isRegistered<AppStore>()) {
      Request.app.logoutLocal();
    }
    handler.next(err);
  }
}
