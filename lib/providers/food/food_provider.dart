import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import 'food_state.dart';

part 'food_provider.g.dart';

@riverpod
class FoodListNotifier extends _$FoodListNotifier {
  late final BaseFoodRepository _foodRepository;

  @override
  FoodListState build() {
    _foodRepository = ref.watch(foodRepositoryProvider);
    return const FoodListState();
  }

  Future<void> fetchFoodList(String token) async {
    if (state.foodList.isEmpty) {
      state = state.copyWith(isLoading: true);
    }
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
