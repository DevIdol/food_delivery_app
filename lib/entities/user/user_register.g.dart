// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRegisterRequestImpl _$$UserRegisterRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRegisterRequestImpl(
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$UserRegisterRequestImplToJson(
        _$UserRegisterRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'address': instance.address,
      'phone': instance.phone,
      'password': instance.password,
    };
