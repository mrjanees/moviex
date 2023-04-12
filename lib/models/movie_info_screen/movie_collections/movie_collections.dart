import 'package:json_annotation/json_annotation.dart';

import 'part.dart';

part 'movie_collections.g.dart';

@JsonSerializable()
class MovieCollections {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'parts')
  List<Part>? parts;

  MovieCollections({
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.parts,
  });

  @override
  String toString() {
    return 'MovieCollections(id: $id, name: $name, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, parts: $parts)';
  }

  factory MovieCollections.fromJson(Map<String, dynamic> json) {
    return _$MovieCollectionsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieCollectionsToJson(this);
}
