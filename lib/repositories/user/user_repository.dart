// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import '../../entities/entities.dart';

abstract class UserRepository {
  Future<UserResponse> login(UserRequest req);
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
      );
      return UserResponse.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response != null && ex.response?.data != null) {
        throw ErrorModel.fromJson(ex.response!.data);
      } else {
        throw Exception('Failed to login: ${ex.message}');
      }
    }
  }
}

final userRepositoryProvider = Provider<UserRepositoryImpl>((ref) {
  return UserRepositoryImpl();
});