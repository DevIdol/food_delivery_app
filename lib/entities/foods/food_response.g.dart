// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodResponseImpl _$$FoodResponseImplFromJson(Map<String, dynamic> json) =>
    _$FoodResponseImpl(
      status: (json['status'] as num).toInt(),
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map(const FoodModelConverter().fromJson)
          .toList(),
    );

Map<String, dynamic> _$$FoodResponseImplToJson(_$FoodResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.map(const FoodModelConverter().toJson).toList(),
    };
