import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'upcoming.g.dart';

@JsonSerializable()
class Upcoming {
  @JsonKey(name: 'results')
  List<UpcomingResult>? results;

  Upcoming({this.results});

  @override
  String toString() => 'Upcoming(results: $results)';

  factory Upcoming.fromJson(Map<String, dynamic> json) {
    return _$UpcomingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpcomingToJson(this);
}
