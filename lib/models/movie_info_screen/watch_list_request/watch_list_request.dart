import 'package:json_annotation/json_annotation.dart';

part 'watch_list_request.g.dart';

@JsonSerializable()
class WatchListRequest {
  @JsonKey(name: 'media_type')
  String? mediaType;
  @JsonKey(name: 'media_id')
  int? mediaId;
  @JsonKey(name: 'watchlist')
  bool? watchlist;

  WatchListRequest({this.mediaType, this.mediaId, this.watchlist});

  WatchListRequest.create({this.mediaType, this.mediaId, this.watchlist});
  @override
  String toString() {
    return 'WatchListRequest(mediaType: $mediaType, mediaId: $mediaId, watchlist: $watchlist)';
  }

  factory WatchListRequest.fromJson(Map<String, dynamic> json) {
    return _$WatchListRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WatchListRequestToJson(this);
}
