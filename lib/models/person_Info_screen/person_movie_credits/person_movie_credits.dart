import 'package:json_annotation/json_annotation.dart';

import 'cast.dart';
import 'crew.dart';

part 'person_movie_credits.g.dart';

@JsonSerializable()
class PersonMovieCredits {
  @JsonKey(name: 'cast')
  List<Cast>? cast;
  @JsonKey(name: 'crew')
  List<Crew>? crew;
  @JsonKey(name: 'id')
  int? id;

  PersonMovieCredits({this.cast, this.crew, this.id});

  @override
  String toString() {
    return 'PersonMovieCredits(cast: $cast, crew: $crew, id: $id)';
  }

  factory PersonMovieCredits.fromJson(Map<String, dynamic> json) {
    return _$PersonMovieCreditsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonMovieCreditsToJson(this);
}
