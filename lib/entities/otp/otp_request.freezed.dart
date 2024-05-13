// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OTPRequest _$OTPRequestFromJson(Map<String, dynamic> json) {
  return _OTPRequest.fromJson(json);
}

/// @nodoc
mixin _$OTPRequest {
  int get otp => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OTPRequestCopyWith<OTPRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OTPRequestCopyWith<$Res> {
  factory $OTPRequestCopyWith(
          OTPRequest value, $Res Function(OTPRequest) then) =
      _$OTPRequestCopyWithImpl<$Res, OTPRequest>;
  @useResult
  $Res call({int otp, String token});
}

/// @nodoc
class _$OTPRequestCopyWithImpl<$Res, $Val extends OTPRequest>
    implements $OTPRequestCopyWith<$Res> {
  _$OTPRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as int,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OTPRequestImplCopyWith<$Res>
    implements $OTPRequestCopyWith<$Res> {
  factory _$$OTPRequestImplCopyWith(
          _$OTPRequestImpl value, $Res Function(_$OTPRequestImpl) then) =
      __$$OTPRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int otp, String token});
}

/// @nodoc
class __$$OTPRequestImplCopyWithImpl<$Res>
    extends _$OTPRequestCopyWithImpl<$Res, _$OTPRequestImpl>
    implements _$$OTPRequestImplCopyWith<$Res> {
  __$$OTPRequestImplCopyWithImpl(
      _$OTPRequestImpl _value, $Res Function(_$OTPRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
    Object? token = null,
  }) {
    return _then(_$OTPRequestImpl(
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as int,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OTPRequestImpl implements _OTPRequest {
  const _$OTPRequestImpl({required this.otp, required this.token});

  factory _$OTPRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OTPRequestImplFromJson(json);

  @override
  final int otp;
  @override
  final String token;

  @override
  String toString() {
    return 'OTPRequest(otp: $otp, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OTPRequestImpl &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, otp, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OTPRequestImplCopyWith<_$OTPRequestImpl> get copyWith =>
      __$$OTPRequestImplCopyWithImpl<_$OTPRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OTPRequestImplToJson(
      this,
    );
  }
}

abstract class _OTPRequest implements OTPRequest {
  const factory _OTPRequest(
      {required final int otp, required final String token}) = _$OTPRequestImpl;

  factory _OTPRequest.fromJson(Map<String, dynamic> json) =
      _$OTPRequestImpl.fromJson;

  @override
  int get otp;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$OTPRequestImplCopyWith<_$OTPRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
