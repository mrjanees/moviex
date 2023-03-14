import 'package:json_annotation/json_annotation.dart';

part 'request_token_response.g.dart';

@JsonSerializable()
class RequestTokenResponse {
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'expires_at')
  String? expiresAt;
  @JsonKey(name: 'request_token')
  String? requestToken;

  RequestTokenResponse({this.success, this.expiresAt, this.requestToken});

  factory RequestTokenResponse.fromJson(Map<String, dynamic> json) {
    return _$RequestTokenResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RequestTokenResponseToJson(this);
  @override
  String toString() {
    return "{$success,$requestToken,$expiresAt}";
  }
}
