// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['_id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      verified: json['verified'] as bool,
      otp: (json['otp'] as num).toInt(),
      otpExpiry: DateTime.parse(json['otp_expiry'] as String),
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      orders:
          (json['orders'] as List<dynamic>).map((e) => e as String).toList(),
      carts: (json['carts'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>?)
          .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'address': instance.address,
      'phone': instance.phone,
      'verified': instance.verified,
      'otp': instance.otp,
      'otp_expiry': instance.otpExpiry.toIso8601String(),
      'lat': instance.lat,
      'lng': instance.lng,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'orders': instance.orders,
      'carts': instance.carts,
    };
