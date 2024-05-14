// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import '../../entities/entities.dart';

abstract class BaseFoodRepository {
  Future<FoodResponse> getFoods(String token);
}

class FoodRepositoryImpl implements BaseFoodRepository {
  late Dio _dio;

  FoodRepositoryImpl() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://172.20.70.85:8000/api/v1/user',
        responseType: ResponseType.json,
      ),
    );
  }

  @override
  Future<FoodResponse> getFoods(String token) async {
    try {
      final response = await _dio.get(
        '/foods',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      return FoodResponse.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response != null && ex.response?.data != null) {
        throw ErrorModel.fromJson(ex.response!.data);
      } else {
        throw Exception('Failed to food resquest!');
      }
    }
  }
}

final foodRepositoryProvider = Provider<FoodRepositoryImpl>((ref) {
  return FoodRepositoryImpl();
});
