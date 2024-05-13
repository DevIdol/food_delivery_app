// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:food_app/entities/otp/otp_request.dart';
import 'package:riverpod/riverpod.dart';
import '../../entities/entities.dart';

abstract class UserRepository {
  Future<UserResponse> login(UserRequest req);
  Future<UserResponse> signup(UserRegisterRequest req);
  Future<UserResponse> verifyOTP(OTPRequest req);
}

class UserRepositoryImpl implements UserRepository {
  late Dio _dio;

  UserRepositoryImpl() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://172.20.30.52:8000/api/v1/user',
        responseType: ResponseType.json,
      ),
    );
  }

  @override
  Future<UserResponse> login(UserRequest req) async {
    try {
      final response = await _dio.post(
        '/login',
        data: req.toJson(),
        options: Options(
          receiveTimeout: const Duration(seconds: 5000),
          sendTimeout: const Duration(seconds: 5000),
        ),
      );
      return UserResponse.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response != null && ex.response!.statusCode == 404) {
        throw ErrorModel.fromJson(ex.response!.data);
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Failed to login');
    }
  }

  @override
  Future<UserResponse> signup(UserRegisterRequest req) async {
    try {
      final response = await _dio.post(
        '/signup',
        data: req.toJson(),
      );
      return UserResponse.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response != null && ex.response?.data != null) {
        throw ErrorModel.fromJson(ex.response!.data);
      } else {
        throw Exception('Failed to signup repo');
      }
    }
  }

  @override
  Future<UserResponse> verifyOTP(OTPRequest req) async {
    try {
      final response = await _dio.patch(
        '/verify',
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
        throw Exception('Failed to verify otp');
      }
    }
  }
}

final userRepositoryProvider = Provider<UserRepositoryImpl>((ref) {
  return UserRepositoryImpl();
});
