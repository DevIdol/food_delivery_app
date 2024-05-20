import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_response.freezed.dart';
part 'http_response.g.dart';

@freezed
class HTTPResponse with _$HTTPResponse {
  const factory HTTPResponse({
    required int status,
    required String name,
    required String message,
    @JsonKey(includeToJson: false) String? accessToken,
  }) = _HTTPResponse;

  factory HTTPResponse.fromJson(Map<String, dynamic> json) => _$HTTPResponseFromJson(json);
}
