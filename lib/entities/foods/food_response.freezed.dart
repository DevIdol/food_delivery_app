// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodResponse _$FoodResponseFromJson(Map<String, dynamic> json) {
  return _FoodResponse.fromJson(json);
}

/// @nodoc
mixin _$FoodResponse {
  int get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @FoodModelConverter()
  List<FoodModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodResponseCopyWith<FoodResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodResponseCopyWith<$Res> {
  factory $FoodResponseCopyWith(
          FoodResponse value, $Res Function(FoodResponse) then) =
      _$FoodResponseCopyWithImpl<$Res, FoodResponse>;
  @useResult
  $Res call(
      {int status, String message, @FoodModelConverter() List<FoodModel> data});
}

/// @nodoc
class _$FoodResponseCopyWithImpl<$Res, $Val extends FoodResponse>
    implements $FoodResponseCopyWith<$Res> {
  _$FoodResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FoodModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodResponseImplCopyWith<$Res>
    implements $FoodResponseCopyWith<$Res> {
  factory _$$FoodResponseImplCopyWith(
          _$FoodResponseImpl value, $Res Function(_$FoodResponseImpl) then) =
      __$$FoodResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int status, String message, @FoodModelConverter() List<FoodModel> data});
}

/// @nodoc
class __$$FoodResponseImplCopyWithImpl<$Res>
    extends _$FoodResponseCopyWithImpl<$Res, _$FoodResponseImpl>
    implements _$$FoodResponseImplCopyWith<$Res> {
  __$$FoodResponseImplCopyWithImpl(
      _$FoodResponseImpl _value, $Res Function(_$FoodResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$FoodResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FoodModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodResponseImpl implements _FoodResponse {
  const _$FoodResponseImpl(
      {required this.status,
      required this.message,
      @FoodModelConverter() required final List<FoodModel> data})
      : _data = data;

  factory _$FoodResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodResponseImplFromJson(json);

  @override
  final int status;
  @override
  final String message;
  final List<FoodModel> _data;
  @override
  @FoodModelConverter()
  List<FoodModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'FoodResponse(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodResponseImplCopyWith<_$FoodResponseImpl> get copyWith =>
      __$$FoodResponseImplCopyWithImpl<_$FoodResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodResponseImplToJson(
      this,
    );
  }
}

abstract class _FoodResponse implements FoodResponse {
  const factory _FoodResponse(
          {required final int status,
          required final String message,
          @FoodModelConverter() required final List<FoodModel> data}) =
      _$FoodResponseImpl;

  factory _FoodResponse.fromJson(Map<String, dynamic> json) =
      _$FoodResponseImpl.fromJson;

  @override
  int get status;
  @override
  String get message;
  @override
  @FoodModelConverter()
  List<FoodModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$FoodResponseImplCopyWith<_$FoodResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
