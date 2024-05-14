import 'package:food_app/utils/converters/food_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'food_model.dart';

part 'food_response.freezed.dart';
part 'food_response.g.dart';

@freezed
class FoodResponse with _$FoodResponse {
  const factory FoodResponse({
    required int status,
    required String message,
    @FoodModelConverter() required List<FoodModel> data,
  }) = _FoodResponse;

  factory FoodResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodResponseFromJson(json);
}
