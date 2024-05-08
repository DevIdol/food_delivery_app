// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  int get otp => throw _privateConstructorUsedError;
  @JsonKey(name: 'otp_expiry')
  DateTime get otpExpiry => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<String> get orders => throw _privateConstructorUsedError;
  List<Map<String, dynamic>?> get carts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String email,
      String firstName,
      String lastName,
      String address,
      String phone,
      bool verified,
      int otp,
      @JsonKey(name: 'otp_expiry') DateTime otpExpiry,
      double lat,
      double lng,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt,
      List<String> orders,
      List<Map<String, dynamic>?> carts});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? address = null,
    Object? phone = null,
    Object? verified = null,
    Object? otp = null,
    Object? otpExpiry = null,
    Object? lat = null,
    Object? lng = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? orders = null,
    Object? carts = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as int,
      otpExpiry: null == otpExpiry
          ? _value.otpExpiry
          : otpExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<String>,
      carts: null == carts
          ? _value.carts
          : carts // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String email,
      String firstName,
      String lastName,
      String address,
      String phone,
      bool verified,
      int otp,
      @JsonKey(name: 'otp_expiry') DateTime otpExpiry,
      double lat,
      double lng,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt,
      List<String> orders,
      List<Map<String, dynamic>?> carts});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? address = null,
    Object? phone = null,
    Object? verified = null,
    Object? otp = null,
    Object? otpExpiry = null,
    Object? lat = null,
    Object? lng = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? orders = null,
    Object? carts = null,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as int,
      otpExpiry: null == otpExpiry
          ? _value.otpExpiry
          : otpExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<String>,
      carts: null == carts
          ? _value._carts
          : carts // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.address,
      required this.phone,
      required this.verified,
      required this.otp,
      @JsonKey(name: 'otp_expiry') required this.otpExpiry,
      required this.lat,
      required this.lng,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt,
      required final List<String> orders,
      required final List<Map<String, dynamic>?> carts})
      : _orders = orders,
        _carts = carts;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String address;
  @override
  final String phone;
  @override
  final bool verified;
  @override
  final int otp;
  @override
  @JsonKey(name: 'otp_expiry')
  final DateTime otpExpiry;
  @override
  final double lat;
  @override
  final double lng;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;
  final List<String> _orders;
  @override
  List<String> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  final List<Map<String, dynamic>?> _carts;
  @override
  List<Map<String, dynamic>?> get carts {
    if (_carts is EqualUnmodifiableListView) return _carts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_carts);
  }

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, firstName: $firstName, lastName: $lastName, address: $address, phone: $phone, verified: $verified, otp: $otp, otpExpiry: $otpExpiry, lat: $lat, lng: $lng, createdAt: $createdAt, updatedAt: $updatedAt, orders: $orders, carts: $carts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.otpExpiry, otpExpiry) ||
                other.otpExpiry == otpExpiry) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            const DeepCollectionEquality().equals(other._carts, _carts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      firstName,
      lastName,
      address,
      phone,
      verified,
      otp,
      otpExpiry,
      lat,
      lng,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_orders),
      const DeepCollectionEquality().hash(_carts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {@JsonKey(name: '_id') required final String id,
      required final String email,
      required final String firstName,
      required final String lastName,
      required final String address,
      required final String phone,
      required final bool verified,
      required final int otp,
      @JsonKey(name: 'otp_expiry') required final DateTime otpExpiry,
      required final double lat,
      required final double lng,
      @JsonKey(name: 'createdAt') required final DateTime createdAt,
      @JsonKey(name: 'updatedAt') required final DateTime updatedAt,
      required final List<String> orders,
      required final List<Map<String, dynamic>?> carts}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get email;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get address;
  @override
  String get phone;
  @override
  bool get verified;
  @override
  int get otp;
  @override
  @JsonKey(name: 'otp_expiry')
  DateTime get otpExpiry;
  @override
  double get lat;
  @override
  double get lng;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt;
  @override
  List<String> get orders;
  @override
  List<Map<String, dynamic>?> get carts;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
