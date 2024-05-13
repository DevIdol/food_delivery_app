import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_request.freezed.dart';
part 'otp_request.g.dart';

@freezed
class OTPRequest with _$OTPRequest {
  const factory OTPRequest({
    required int otp,
    required String token,
  }) = _OTPRequest;

  factory OTPRequest.fromJson(Map<String, dynamic> json) =>
      _$OTPRequestFromJson(json);
}
