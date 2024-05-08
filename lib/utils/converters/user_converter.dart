import 'package:freezed_annotation/freezed_annotation.dart';
import '../../entities/entities.dart';

class UserModelConverter
    implements JsonConverter<UserModel, dynamic> {
  const UserModelConverter();
  @override
  UserModel fromJson(dynamic data) {
    final json = data as Map<String, dynamic>;
    return UserModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(UserModel userData) {
    return userData.toJson();
  }
}