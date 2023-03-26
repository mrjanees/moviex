import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'tv.g.dart';

@JsonSerializable()
class Tv {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<TvResult>? results;

  Tv({this.page, this.results});

  @override
  String toString() => 'Tv(page: $page, results: $results)';

  factory Tv.fromJson(Map<String, dynamic> json) => _$TvFromJson(json);

  Map<String, dynamic> toJson() => _$TvToJson(this);
}
