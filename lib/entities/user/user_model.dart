import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: '_id') required String id,
    required String email,
    required String firstName,
    required String lastName,
    required String address,
    required String phone,
    required bool verified,
    required int otp,
    @JsonKey(name: 'otp_expiry') required DateTime otpExpiry,
    required double lat,
    required double lng,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
    required List<String> orders,
    required List<Map<String, dynamic>?> carts,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
