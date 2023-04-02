import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'top_rated_people.g.dart';

@JsonSerializable()
class TopRatedPeople {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<Result>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;

  TopRatedPeople({this.page, this.results, this.totalPages});

  @override
  String toString() {
    return 'TopRatedPeople(page: $page, results: $results, totalPages: $totalPages)';
  }

  factory TopRatedPeople.fromJson(Map<String, dynamic> json) {
    return _$TopRatedPeopleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopRatedPeopleToJson(this);
}
