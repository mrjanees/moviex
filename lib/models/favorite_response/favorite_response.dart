import 'package:json_annotation/json_annotation.dart';

part 'favorite_response.g.dart';

@JsonSerializable()
class FavoriteResponse {
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'status_code')
  int? statusCode;
  @JsonKey(name: 'status_message')
  String? statusMessage;

  FavoriteResponse({this.success, this.statusCode, this.statusMessage});

  @override
  String toString() {
    return 'FavoriteResponse(success: $success, statusCode: $statusCode, statusMessage: $statusMessage)';
  }

  factory FavoriteResponse.fromJson(Map<String, dynamic> json) {
    return _$FavoriteResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FavoriteResponseToJson(this);
}
