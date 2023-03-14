import 'package:json_annotation/json_annotation.dart';

part 'session_id_response.g.dart';

@JsonSerializable()
class SessionIdResponse {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: 'session_id')
  String? sessionId;

  SessionIdResponse({this.success, this.sessionId});

  factory SessionIdResponse.fromJson(Map<String, dynamic> json) {
    return _$SessionIdResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SessionIdResponseToJson(this);
  @override
  String toString() {
    return '${sessionId}';
  }
}
