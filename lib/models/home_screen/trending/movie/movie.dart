import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<MovieResult>? results;

  Movie({this.page, this.results});

  @override
  String toString() => 'Movie(page: $page, results: $results)';

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
