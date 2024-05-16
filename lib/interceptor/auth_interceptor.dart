// ignore_for_file: deprecated_member_use
import 'package:dio/dio.dart';
import 'package:food_app/utils/constants/app_routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/providers.dart';
import '../repositories/repositories.dart';

class AuthInterceptor extends Interceptor {
  Ref ref;

  AuthInterceptor(this.ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path != AppRoute.login && options.path != AppRoute.signup) {
      final token = ref.watch(setAccessTokenStateProvider);
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 403 &&
        err.response?.data['message'] == 'Token expired') {
      final token = await _refreshToken();
      if (token != null) {
        final options = err.response!.requestOptions;
        options.headers['Authorization'] = 'Bearer $token';
        final response = await ref.watch(dioProvider).fetch(options);
        handler.resolve(response);
      } else {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }

  Future<String?> _refreshToken() async {
    final refreshToken = ref.watch(setRefreshTokenStateProvider);
    try {
      final response =
          await ref.watch(userRepositoryProvider).refreshToken(refreshToken!);
      final newToken = response.accessToken;
      ref.read(setAccessTokenStateProvider.notifier).state = newToken;
      ref.read(setAccessTokenProvider(newToken));
      return newToken;
    } catch (e) {
      return null;
    }
  }
}

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://172.20.80.69:8000/api/v1/user',
      responseType: ResponseType.json,
    ),
  );
  dio.interceptors.add(AuthInterceptor(ref));
  return dio;
});
