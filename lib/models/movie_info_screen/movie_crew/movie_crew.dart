import 'package:json_annotation/json_annotation.dart';

import 'crew.dart';

part 'movie_crew.g.dart';

@JsonSerializable()
class MovieCrew {
  @JsonKey(name: 'crew')
  List<Crew>? crew;

  MovieCrew({this.crew});

  @override
  String toString() => 'MovieCrew(crew: $crew)';

  factory MovieCrew.fromJson(Map<String, dynamic> json) {
    return _$MovieCrewFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieCrewToJson(this);
}
