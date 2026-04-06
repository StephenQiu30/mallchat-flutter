import 'package:dio/dio.dart';

/// A centralized Request client for MallChat, inspired by umi-openapi/request.
/// All microservices are accessed through the Gateway (port 8080).
class AppRequest {
  static Dio? _instance;

  static const String gatewayUrl = 'http://localhost:8080';

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
        _AuthInterceptor(),
        _LogInterceptor(),
        _ErrorInterceptor(),
      ]);
    }
    return _instance!;
  }
}

class _AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: Get token from local storage or AuthController
    const String? token = null; 
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

class _LogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('--> ${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('<-- ${response.statusCode} ${response.requestOptions.uri}');
    handler.next(response);
  }
}

class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Handle Unauthorized - e.g., redirect to login
      print('Unauthorized! Redirecting to login...');
    }
    handler.next(err);
  }
}
