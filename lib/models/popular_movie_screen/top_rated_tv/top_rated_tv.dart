import 'package:json_annotation/json_annotation.dart';

import 'top_rated_tv_result.dart';

part 'top_rated_tv.g.dart';

@JsonSerializable()
class TopRatedTv {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<TopRatedTvResult>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;

  TopRatedTv({this.page, this.results, this.totalPages});

  @override
  String toString() {
    return 'TopRatedTv(page: $page, results: $results, totalPages: $totalPages)';
  }

  factory TopRatedTv.fromJson(Map<String, dynamic> json) {
    return _$TopRatedTvFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopRatedTvToJson(this);
}
