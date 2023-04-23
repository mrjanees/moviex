import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class AllResult {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;

  @JsonKey(name: 'release_date')
  String? releaseDate;

  @JsonKey(name: 'first_air_date')
  String? firstAirDate;

  @JsonKey(name: 'vote_average')
  double? voteAverage;

  @JsonKey(name: 'media_type')
  String? mediaType;

  AllResult({
    this.firstAirDate,
    this.name,
    this.backdropPath,
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.genreIds,
    this.releaseDate,
    this.voteAverage,
    this.mediaType
  });

  @override
  String toString() {
    return 'Result( backdropPath: $backdropPath, id: $id, overview: $overview, posterPath: $posterPath, genreIds: $genreIds, releaseDate: $releaseDate, voteAverage: $voteAverage)';
  }

  factory AllResult.fromJson(Map<String, dynamic> json) {
    return _$AllResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllResultToJson(this);
}
