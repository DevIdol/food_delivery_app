// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResponseImpl _$$UserResponseImplFromJson(Map<String, dynamic> json) =>
    _$UserResponseImpl(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String,
      user: const UserModelConverter().fromJson(json['user']),
    );

Map<String, dynamic> _$$UserResponseImplToJson(_$UserResponseImpl instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
      'user': const UserModelConverter().toJson(instance.user),
    };
