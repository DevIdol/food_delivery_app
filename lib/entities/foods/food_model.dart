import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_model.freezed.dart';
part 'food_model.g.dart';

@freezed
class FoodModel with _$FoodModel {
  const factory FoodModel({
    @JsonKey(name: '_id') required String id,
    required String vendorId,
    required String name,
    required String description,
    required String category,
    String? foodType,
    required double readyTime,
    required double price,
    required double rating,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<String?> images,
  }) = _FoodModel;

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);
}
