import 'package:food_app/providers/food/food_state.dart';
import 'package:riverpod/riverpod.dart';
import '../../entities/entities.dart';
import '../../repositories/repositories.dart';



final foodListProvider =
    StateNotifierProvider.autoDispose<FoodListProvider, FoodListState>((ref) {
  final foodRepo = ref.watch(foodRepositoryProvider);
  return FoodListProvider(foodRepo);
});

class FoodListProvider extends StateNotifier<FoodListState> {
  FoodListProvider(this._foodRepository) : super(const FoodListState());

  final BaseFoodRepository _foodRepository;

  Future<void> fetchFoodList(String token) async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await _foodRepository.getFoods(token);
      state = state.copyWith(
        isLoading: false,
        foodList: response.data,
        error: '',
      );
    } on ErrorModel catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.message,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to fetch food list',
      );
    }
  }
}
