import 'package:riverpod/riverpod.dart';
import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import 'food_state.dart';

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
      final response = await _foodRepository.getFoods();
      state = state.copyWith(
        isLoading: false,
        foodList: response.data,
        error: '',
      );
    } on HTTPResponse catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.message,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        foodList: state.foodList,
        error: 'Connection failed!',
      );
    }
  }

  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void updateSelectedFoodType(String foodType) {
    state = state.copyWith(selectedFoodType: foodType);
  }

  void updateSelectedCategory(String category) {
    state = state.copyWith(selectedCategory: category);
  }

  List<FoodModel> get filteredFoodList {
    return state.foodList.where((food) {
      final matchesName =
          food.name.toLowerCase().contains(state.searchQuery.toLowerCase()) ||
              food.price
                  .toString()
                  .toLowerCase()
                  .contains(state.searchQuery.toLowerCase());
      final matchesFoodType = state.selectedFoodType.isEmpty ||
          food.foodType == state.selectedFoodType;
      final matchesCategory = state.selectedCategory.isEmpty ||
          food.category == state.selectedCategory;
      return matchesName && matchesFoodType && matchesCategory;
    }).toList();
  }
}
