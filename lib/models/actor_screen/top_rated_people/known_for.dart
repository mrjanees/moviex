import 'package:json_annotation/json_annotation.dart';

part 'known_for.g.dart';

@JsonSerializable()
class KnownFor {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'media_type')
  String? mediaType;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;

  KnownFor({
    this.backdropPath,
    this.id,
    this.mediaType,
    this.originalTitle,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  @override
  String toString() {
    return 'KnownFor(backdropPath: $backdropPath, id: $id, mediaType: $mediaType, originalTitle: $originalTitle, posterPath: $posterPath, releaseDate: $releaseDate, title: $title,  voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  factory KnownFor.fromJson(Map<String, dynamic> json) {
    return _$KnownForFromJson(json);
  }

  Map<String, dynamic> toJson() => _$KnownForToJson(this);
}
