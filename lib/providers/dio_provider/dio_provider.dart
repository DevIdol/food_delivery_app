import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/dio_config.dart';
import '../../interceptor/auth_interceptor.dart';
import '../providers.dart';

final dioProvider = Provider<Dio>((ref) {
  final context = ref.watch(navigationContextProvider);

  final dio = Dio(DioConfig.dioOptions);

  dio.interceptors.add(AuthInterceptor(ref, dio, context));

  dio.interceptors.add(InterceptorsWrapper(
    onError: (DioException e, ErrorInterceptorHandler handler) {
      return handler.next(e);
    },
  ));

  return dio;
});
