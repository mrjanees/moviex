import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'movie_generate_model.g.dart';

@JsonSerializable()
class MovieGenerateModel {
  @JsonKey(name: 'page')
  int? page;
  List<Result>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  MovieGenerateModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  @override
  String toString() {
    return 'MovieGenerateModel(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  factory MovieGenerateModel.fromJson(Map<String, dynamic> json) {
    return _$MovieGenerateModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieGenerateModelToJson(this);
}
