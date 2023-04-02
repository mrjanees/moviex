import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class TopRatedResult {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
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

  TopRatedResult({
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  @override
  String toString() {
    return 'Result( backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle,posterPath: $posterPath, releaseDate: $releaseDate, title: $title, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  factory TopRatedResult.fromJson(Map<String, dynamic> json) {
    return _$TopRatedResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopRatedResultToJson(this);
}
