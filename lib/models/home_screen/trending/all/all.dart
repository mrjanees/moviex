import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'all.g.dart';

@JsonSerializable()
class All {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<Result>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  All({this.page, this.results, this.totalPages, this.totalResults});

  @override
  String toString() {
    return 'All(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  factory All.fromJson(Map<String, dynamic> json) => _$AllFromJson(json);

  Map<String, dynamic> toJson() => _$AllToJson(this);
}
