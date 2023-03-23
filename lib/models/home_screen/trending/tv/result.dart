import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  @JsonKey(name: 'first_air_date')
  String? firstAirDate;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'origin_country')
  List<String>? originCountry;

  Result({
    this.backdropPath,
    this.id,
    this.name,
    this.posterPath,
    this.genreIds,
    this.firstAirDate,
    this.voteAverage,
    this.originCountry,
  });

  @override
  String toString() {
    return 'Result(backdropPath: $backdropPath, id: $id, name: $name, posterPath: $posterPath, genreIds: $genreIds, firstAirDate: $firstAirDate, voteAverage: $voteAverage, originCountry: $originCountry)';
  }

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
