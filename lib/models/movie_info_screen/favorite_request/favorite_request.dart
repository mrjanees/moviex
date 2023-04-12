import 'package:json_annotation/json_annotation.dart';

part 'favorite_request.g.dart';

@JsonSerializable()
class FavoriteRequest {
  @JsonKey(name: 'media_type')
  String? mediaType;
  @JsonKey(name: 'media_id')
  int? mediaId;
  @JsonKey(name: 'favorite')
  bool? favorite;

  FavoriteRequest({this.mediaType, this.mediaId, this.favorite});
  FavoriteRequest.create(
      {required this.favorite, required this.mediaId, required this.mediaType});

  @override
  String toString() {
    return 'FavoriteRequest(mediaType: $mediaType, mediaId: $mediaId, favorite: $favorite)';
  }

  factory FavoriteRequest.fromJson(Map<String, dynamic> json) {
    return _$FavoriteRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FavoriteRequestToJson(this);
}
