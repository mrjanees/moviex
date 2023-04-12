import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: 'id')
  int? id;
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

  Result({
    this.id,
    this.originalTitle,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
  });

  @override
  String toString() {
    return 'Result(id: $id, originalTitle: $originalTitle, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, voteAverage: $voteAverage)';
  }

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
