import 'package:json_annotation/json_annotation.dart';

part 'validate_with_login_request.g.dart';

@JsonSerializable()
class ValidateWithLoginRequest {
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'request_token')
  String? requestToken;

  ValidateWithLoginRequest({
    this.username,
    this.password,
    this.requestToken,
  });
  ValidateWithLoginRequest.create(
      {required this.password,
      required this.requestToken,
      required this.username});

  factory ValidateWithLoginRequest.fromJson(Map<String, dynamic> json) {
    return _$ValidateWithLoginRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ValidateWithLoginRequestToJson(this);
}
