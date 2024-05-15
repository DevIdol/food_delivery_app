// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodModelImpl _$$FoodModelImplFromJson(Map<String, dynamic> json) =>
    _$FoodModelImpl(
      id: json['_id'] as String,
      vendorId: json['vendorId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      foodType: json['foodType'] as String?,
      readyTime: (json['readyTime'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String?).toList(),
    );

Map<String, dynamic> _$$FoodModelImplToJson(_$FoodModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'vendorId': instance.vendorId,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'foodType': instance.foodType,
      'readyTime': instance.readyTime,
      'price': instance.price,
      'rating': instance.rating,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'images': instance.images,
    };
