// ignore_for_file: deprecated_member_use
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../entities/entities.dart';
import '../../interceptor/auth_interceptor.dart';
import '../../utils/utils.dart';

abstract class UserRepository {
  Future<UserResponse> login(UserRequest req);
  Future<UserResponse> signup(UserRegisterRequest req);
  Future<UserResponse> verifyOTP(OTPRequest req);
  Future<UserResponse> refreshToken(String token);
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
      return UserResponse.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response != null && ex.response!.statusCode == 404) {
        throw ErrorModel.fromJson(ex.response!.data);
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
      return UserResponse.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response != null && ex.response?.data != null) {
        throw ErrorModel.fromJson(ex.response!.data);
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
    } on DioError catch (ex) {
      if (ex.response != null && ex.response?.data != null) {
        throw ErrorModel.fromJson(ex.response!.data);
      } else {
        throw Exception('Failed to verify OTP');
      }
    }
  }

  @override
  Future<UserResponse> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.post(
        AppRoute.refreshToken,
        options: Options(
          headers: {'Authorization': 'Bearer $refreshToken'},
        ),
      );
      return UserResponse.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response != null && ex.response?.data != null) {
        throw ErrorModel.fromJson(ex.response!.data);
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
