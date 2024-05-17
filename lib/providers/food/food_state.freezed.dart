// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FoodListState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<FoodModel> get foodList => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodListStateCopyWith<FoodListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodListStateCopyWith<$Res> {
  factory $FoodListStateCopyWith(
          FoodListState value, $Res Function(FoodListState) then) =
      _$FoodListStateCopyWithImpl<$Res, FoodListState>;
  @useResult
  $Res call({bool isLoading, List<FoodModel> foodList, String error});
}

/// @nodoc
class _$FoodListStateCopyWithImpl<$Res, $Val extends FoodListState>
    implements $FoodListStateCopyWith<$Res> {
  _$FoodListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? foodList = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      foodList: null == foodList
          ? _value.foodList
          : foodList // ignore: cast_nullable_to_non_nullable
              as List<FoodModel>,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodListStateImplCopyWith<$Res>
    implements $FoodListStateCopyWith<$Res> {
  factory _$$FoodListStateImplCopyWith(
          _$FoodListStateImpl value, $Res Function(_$FoodListStateImpl) then) =
      __$$FoodListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<FoodModel> foodList, String error});
}

/// @nodoc
class __$$FoodListStateImplCopyWithImpl<$Res>
    extends _$FoodListStateCopyWithImpl<$Res, _$FoodListStateImpl>
    implements _$$FoodListStateImplCopyWith<$Res> {
  __$$FoodListStateImplCopyWithImpl(
      _$FoodListStateImpl _value, $Res Function(_$FoodListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? foodList = null,
    Object? error = null,
  }) {
    return _then(_$FoodListStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      foodList: null == foodList
          ? _value._foodList
          : foodList // ignore: cast_nullable_to_non_nullable
              as List<FoodModel>,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FoodListStateImpl implements _FoodListState {
  const _$FoodListStateImpl(
      {this.isLoading = true,
      final List<FoodModel> foodList = const <FoodModel>[],
      this.error = ''})
      : _foodList = foodList;

  @override
  @JsonKey()
  final bool isLoading;
  final List<FoodModel> _foodList;
  @override
  @JsonKey()
  List<FoodModel> get foodList {
    if (_foodList is EqualUnmodifiableListView) return _foodList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foodList);
  }

  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'FoodListState(isLoading: $isLoading, foodList: $foodList, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodListStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._foodList, _foodList) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_foodList), error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodListStateImplCopyWith<_$FoodListStateImpl> get copyWith =>
      __$$FoodListStateImplCopyWithImpl<_$FoodListStateImpl>(this, _$identity);
}

abstract class _FoodListState implements FoodListState {
  const factory _FoodListState(
      {final bool isLoading,
      final List<FoodModel> foodList,
      final String error}) = _$FoodListStateImpl;

  @override
  bool get isLoading;
  @override
  List<FoodModel> get foodList;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$FoodListStateImplCopyWith<_$FoodListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
