// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OTPRequestImpl _$$OTPRequestImplFromJson(Map<String, dynamic> json) =>
    _$OTPRequestImpl(
      otp: (json['otp'] as num).toInt(),
      token: json['token'] as String,
    );

Map<String, dynamic> _$$OTPRequestImplToJson(_$OTPRequestImpl instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'token': instance.token,
    };
