import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_register.freezed.dart';
part 'user_register.g.dart';

@freezed
class UserRegisterRequest with _$UserRegisterRequest {
  const factory UserRegisterRequest({
    required String email,
    required String firstName,
    required String lastName,
    required String address,
    required String phone,
    required String password,
  }) = _UserRegisterRequest;

  factory UserRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterRequestFromJson(json);
}
