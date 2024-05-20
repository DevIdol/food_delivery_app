// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'http_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HTTPResponse _$HTTPResponseFromJson(Map<String, dynamic> json) {
  return _HTTPResponse.fromJson(json);
}

/// @nodoc
mixin _$HTTPResponse {
  int get status => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String? get accessToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HTTPResponseCopyWith<HTTPResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HTTPResponseCopyWith<$Res> {
  factory $HTTPResponseCopyWith(
          HTTPResponse value, $Res Function(HTTPResponse) then) =
      _$HTTPResponseCopyWithImpl<$Res, HTTPResponse>;
  @useResult
  $Res call(
      {int status,
      String name,
      String message,
      @JsonKey(includeToJson: false) String? accessToken});
}

/// @nodoc
class _$HTTPResponseCopyWithImpl<$Res, $Val extends HTTPResponse>
    implements $HTTPResponseCopyWith<$Res> {
  _$HTTPResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? name = null,
    Object? message = null,
    Object? accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HTTPResponseImplCopyWith<$Res>
    implements $HTTPResponseCopyWith<$Res> {
  factory _$$HTTPResponseImplCopyWith(
          _$HTTPResponseImpl value, $Res Function(_$HTTPResponseImpl) then) =
      __$$HTTPResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int status,
      String name,
      String message,
      @JsonKey(includeToJson: false) String? accessToken});
}

/// @nodoc
class __$$HTTPResponseImplCopyWithImpl<$Res>
    extends _$HTTPResponseCopyWithImpl<$Res, _$HTTPResponseImpl>
    implements _$$HTTPResponseImplCopyWith<$Res> {
  __$$HTTPResponseImplCopyWithImpl(
      _$HTTPResponseImpl _value, $Res Function(_$HTTPResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? name = null,
    Object? message = null,
    Object? accessToken = freezed,
  }) {
    return _then(_$HTTPResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HTTPResponseImpl implements _HTTPResponse {
  const _$HTTPResponseImpl(
      {required this.status,
      required this.name,
      required this.message,
      @JsonKey(includeToJson: false) this.accessToken});

  factory _$HTTPResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HTTPResponseImplFromJson(json);

  @override
  final int status;
  @override
  final String name;
  @override
  final String message;
  @override
  @JsonKey(includeToJson: false)
  final String? accessToken;

  @override
  String toString() {
    return 'HTTPResponse(status: $status, name: $name, message: $message, accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HTTPResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, name, message, accessToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HTTPResponseImplCopyWith<_$HTTPResponseImpl> get copyWith =>
      __$$HTTPResponseImplCopyWithImpl<_$HTTPResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HTTPResponseImplToJson(
      this,
    );
  }
}

abstract class _HTTPResponse implements HTTPResponse {
  const factory _HTTPResponse(
          {required final int status,
          required final String name,
          required final String message,
          @JsonKey(includeToJson: false) final String? accessToken}) =
      _$HTTPResponseImpl;

  factory _HTTPResponse.fromJson(Map<String, dynamic> json) =
      _$HTTPResponseImpl.fromJson;

  @override
  int get status;
  @override
  String get name;
  @override
  String get message;
  @override
  @JsonKey(includeToJson: false)
  String? get accessToken;
  @override
  @JsonKey(ignore: true)
  _$$HTTPResponseImplCopyWith<_$HTTPResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
