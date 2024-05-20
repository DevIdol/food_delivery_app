// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HTTPResponseImpl _$$HTTPResponseImplFromJson(Map<String, dynamic> json) =>
    _$HTTPResponseImpl(
      status: (json['status'] as num).toInt(),
      name: json['name'] as String,
      message: json['message'] as String,
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$$HTTPResponseImplToJson(_$HTTPResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'message': instance.message,
    };
