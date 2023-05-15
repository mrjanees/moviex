import 'package:json_annotation/json_annotation.dart';

import 'cast.dart';
import 'crew.dart';

part 'series_cast.g.dart';

@JsonSerializable()
class SeriesCast {
  @JsonKey(name: 'cast')
  List<Cast>? cast;
  @JsonKey(name: 'crew')
  List<Crew>? crew;
  @JsonKey(name: 'id')
  int? id;

  SeriesCast({this.cast, this.crew, this.id});

  @override
  String toString() => 'SeriesCast(cast: $cast, crew: $crew, id: $id)';

  factory SeriesCast.fromJson(Map<String, dynamic> json) {
    return _$SeriesCastFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SeriesCastToJson(this);
}
