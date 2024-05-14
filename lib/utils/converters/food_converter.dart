// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../entities/entities.dart';

class FoodModelConverter
    implements JsonConverter<FoodModel, dynamic> {
  const FoodModelConverter();
  @override
  FoodModel fromJson(dynamic data) {
    final json = data as Map<String, dynamic>;
    return FoodModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(FoodModel FoodData) {
    return FoodData.toJson();
  }
}