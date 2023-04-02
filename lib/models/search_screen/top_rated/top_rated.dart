import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'top_rated.g.dart';

@JsonSerializable()
class TopRated {
  @JsonKey(name: 'results')
  List<TopRatedResult>? results;

  TopRated({this.results});

  @override
  String toString() => 'TopRated(results: $results)';

  factory TopRated.fromJson(Map<String, dynamic> json) {
    return _$TopRatedFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopRatedToJson(this);
}
