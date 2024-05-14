import 'package:freezed_annotation/freezed_annotation.dart';
import '../../entities/entities.dart';

part 'food_state.freezed.dart';

@freezed
class FoodListState with _$FoodListState {
  const factory FoodListState({
    @Default(false) bool isLoading,
    @Default(<FoodModel>[]) List<FoodModel> foodList,
    @Default('') String error,
  }) = _FoodListState;
}