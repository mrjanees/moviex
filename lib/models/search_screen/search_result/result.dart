import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class SearchResult {
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'known_for_department')
  String? knownfordepartment;
  @JsonKey(name: 'profile_path')
  String? profilePath;
  @JsonKey(name: 'first_air_date')
  String? firstAirDate;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'vote_average')
  double? voteAverage;

  SearchResult({
    this.name,
    this.firstAirDate,
    this.knownfordepartment,
    this.profilePath,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.releaseDate,
    this.title,
    this.voteAverage,
  });

  @override
  String toString() {
    return 'Result(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, releaseDate: $releaseDate, title: $title,voteAverage: $voteAverage)';
  }

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return _$SearchResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}
