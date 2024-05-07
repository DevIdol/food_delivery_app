import 'package:food_app/utils/converters/user_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    required String jwt,
    @UserModelConverter() required UserModel user,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}