import 'package:json_annotation/json_annotation.dart';

part 'session_id_request.g.dart';

@JsonSerializable()
class SessionIdRequest {
  @JsonKey(name: 'request_token')
  String? requestToken;

  SessionIdRequest({this.requestToken});
  SessionIdRequest.create({required this.requestToken});

  factory SessionIdRequest.fromJson(Map<String, dynamic> json) {
    return _$SessionIdRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SessionIdRequestToJson(this);
}
