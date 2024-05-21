import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../entities/entities.dart';
import '../../providers/providers.dart';
import '../../utils/utils.dart';

abstract class UserRepository {
  Future<UserResponse> login(UserRequest req);
  Future<UserResponse> signup(UserRegisterRequest req);
  Future<UserResponse> verifyOTP(OTPRequest req);
  Future<HTTPResponse> refreshToken(String token);
}

class UserRepositoryImpl implements UserRepository {
  final Dio _dio;

  UserRepositoryImpl(this._dio);

  @override
  Future<UserResponse> login(UserRequest req) async {
    try {
      final response = await _dio.post(
        AppRoute.login,
        data: req.toJson(),
      );
      final accessToken = response.headers.value('Access-Token');

      if (accessToken == null) {
        throw Exception('Access-Token not found in response headers!');
      }

      final userResponse = UserResponse.fromJson(response.data);
      return userResponse.copyWith(accessToken: accessToken);
    } on DioException catch (ex) {
      if (ex.response != null && ex.response!.statusCode == 404) {
        throw HTTPResponse.fromJson(ex.response!.data);
      } else {
        throw Exception('Failed to login!');
      }
    } catch (e) {
      throw Exception('Failed to login!');
    }
  }

  @override
  Future<UserResponse> signup(UserRegisterRequest req) async {
    try {
      final response = await _dio.post(
        AppRoute.signup,
        data: req.toJson(),
      );
      final accessToken = response.headers.value('Access-Token');

      if (accessToken == null) {
        throw Exception('Access-Token not found in response headers!');
      }

      final userResponse = UserResponse.fromJson(response.data);
      return userResponse.copyWith(accessToken: accessToken);
    } on DioException catch (ex) {
      if (ex.response != null && ex.response?.data != null) {
        throw HTTPResponse.fromJson(ex.response!.data);
      } else {
        throw Exception('Failed to signup');
      }
    }
  }

  @override
  Future<UserResponse> verifyOTP(OTPRequest req) async {
    try {
      final response = await _dio.patch(
        AppRoute.verifyOTP,
        data: req.toJson(),
        options: Options(
          headers: {'Authorization': 'Bearer ${req.token}'},
        ),
      );
      return UserResponse.fromJson(response.data);
    } on DioException catch (ex) {
      if (ex.response != null && ex.response?.data != null) {
        throw HTTPResponse.fromJson(ex.response!.data);
      } else {
        throw Exception('Failed to verify OTP');
      }
    }
  }

  @override
  Future<HTTPResponse> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.post(
        AppRoute.refreshToken,
        options: Options(
          headers: {'Refresh-Token': refreshToken},
        ),
      );
      final accessToken = response.headers.value('Access-Token');

      if (accessToken == null) {
        throw Exception('Access-Token not found in response headers!');
      }
      final refreshTokenRes = HTTPResponse.fromJson(response.data);
      return refreshTokenRes.copyWith(accessToken: accessToken);
    } on DioException catch (ex) {
      if (ex.response != null && ex.response?.data != null) {
        throw HTTPResponse.fromJson(ex.response!.data);
      } else {
        throw Exception('Failed to refresh token');
      }
    }
  }
}

final userRepositoryProvider = Provider<UserRepositoryImpl>((ref) {
  final dio = ref.watch(dioProvider);
  return UserRepositoryImpl(dio);
});
