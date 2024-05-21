import 'package:dio/dio.dart';
import 'package:food_app/utils/constants/app_routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../entities/entities.dart';
import '../../providers/providers.dart';

abstract class BaseFoodRepository {
  Future<FoodResponse> getFoods();
}

class FoodRepositoryImpl implements BaseFoodRepository {
  final Dio _dio;

  FoodRepositoryImpl(this._dio);

  @override
  Future<FoodResponse> getFoods() async {
    try {
      final response = await _dio.get(AppRoute.food);
      return FoodResponse.fromJson(response.data);
    } on DioException catch (ex) {
      if (ex.response != null && ex.response?.data != null) {
        throw HTTPResponse.fromJson(ex.response!.data);
      } else {
        throw Exception('Failed to fetch foods');
      }
    }
  }
}

final foodRepositoryProvider = Provider<FoodRepositoryImpl>((ref) {
  final dio = ref.watch(dioProvider);
  return FoodRepositoryImpl(dio);
});
