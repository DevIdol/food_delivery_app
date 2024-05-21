import 'package:dio/dio.dart';

class DioConfig {
  static const String baseUrl = 'http://172.20.10.35:8000/api/v1/user';
  static const Duration timeout = Duration(seconds: 10);

  static BaseOptions get dioOptions => BaseOptions(
        baseUrl: baseUrl,
        responseType: ResponseType.json,
        sendTimeout: timeout,
        connectTimeout: timeout,
        receiveTimeout: timeout,
      );
}
