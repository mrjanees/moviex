import 'package:json_annotation/json_annotation.dart';

part 'top_rated_tv_result.g.dart';

@JsonSerializable()
class TopRatedTvResult {
  @JsonKey(name: 'first_air_date')
  String? firstAirDate;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'vote_average')
  double? voteAverage;

  TopRatedTvResult({
    this.firstAirDate,
    this.id,
    this.name,
    this.posterPath,
    this.voteAverage,
  });

  @override
  String toString() {
    return 'Result(firstAirDate: $firstAirDate, id: $id, name: $name, posterPath: $posterPath, voteAverage: $voteAverage)';
  }

  factory TopRatedTvResult.fromJson(Map<String, dynamic> json) {
    return _$TopRatedTvResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopRatedTvResultToJson(this);
}
