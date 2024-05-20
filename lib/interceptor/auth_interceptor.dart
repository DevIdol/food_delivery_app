import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/providers.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class AuthInterceptor extends Interceptor {
  final Ref ref;
  final Dio dio;
  final BuildContext context;

  AuthInterceptor(this.ref, this.dio, this.context);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path != AppRoute.login &&
        options.path != AppRoute.signup &&
        options.path != AppRoute.refreshToken) {
      final token = ref.read(setAccessTokenStateProvider);
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
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.data["status"] == 403 &&
        err.response?.data['message'] == 'Token expired') {
      final refreshToken = ref.read(setRefreshTokenStateProvider);
      final newAccessToken = await _handleRefreshToken(refreshToken);

      if (newAccessToken != null) {
        final options = err.response!.requestOptions;
        options.headers['Authorization'] = 'Bearer $newAccessToken';
        final cloneReq = await dio.fetch(options);
        handler.resolve(cloneReq);
      } else {
        handler.next(err);
      }
    } else if (err.response?.data["status"] == 403 &&
        err.response?.data['message'] == 'Refresh token has been expired') {
      showAlertDialog(
          context: context,
          title: 'Session Expired',
          content: 'Your session has expired. Please log in again.',
          okFunc: () => {
                ref
                    .read(userNotifierProvider.notifier)
                    .logout()
                    .then((value) => {
                          if (value)
                            {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.login, (route) => false)
                            }
                        })
              });
    } else {
      handler.next(err);
    }
  }

  Future<String?> _handleRefreshToken(String? refreshToken) async {
    if (refreshToken == null) return null;

    try {
      final response = await ref
          .read(userNotifierProvider.notifier)
          .refreshToken(refreshToken: refreshToken);
      return response.fold(
        (l) => null,
        (r) => ref.read(setAccessTokenStateProvider.notifier).state,
      );
    } catch (e) {
      return null;
    }
  }
}

final dioProvider = Provider<Dio>((ref) {
  final context = ref.watch(navigationContextProvider);
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://172.20.80.20:8000/api/v1/user',
      responseType: ResponseType.json,
      sendTimeout: const Duration(seconds: 10),
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
  dio.interceptors.add(AuthInterceptor(ref, dio, context));
  return dio;
});
