import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'search_result.g.dart';

@JsonSerializable()
class Search {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<SearchResult>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  Search({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  @override
  String toString() {
    return 'SearchResult(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  factory Search.fromJson(Map<String, dynamic> json) {
    return _$SearchFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchToJson(this);
}
