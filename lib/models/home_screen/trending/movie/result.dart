import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'vote_average')
  double? voteAverage;

  Result({
    this.backdropPath,
    this.id,
    this.title,
    this.originalTitle,
    this.posterPath,
    this.genreIds,
    this.releaseDate,
    this.voteAverage,
  });

  @override
  String toString() {
    return 'Result(backdropPath: $backdropPath, id: $id, title: $title, originalTitle: $originalTitle, posterPath: $posterPath, genreIds: $genreIds, releaseDate: $releaseDate, voteAverage: $voteAverage)';
  }

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
