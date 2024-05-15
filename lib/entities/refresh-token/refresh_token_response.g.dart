// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefreshTokenResponseImpl _$$RefreshTokenResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshTokenResponseImpl(
      status: (json['status'] as num).toInt(),
      name: json['name'] as String,
      message: json['message'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$RefreshTokenResponseImplToJson(
        _$RefreshTokenResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'message': instance.message,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
