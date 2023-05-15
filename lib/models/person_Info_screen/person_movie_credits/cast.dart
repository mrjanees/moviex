import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'character')
  String? character;
  @JsonKey(name: 'credit_id')
  String? creditId;

  Cast({
    this.releaseDate,
    this.backdropPath,
    this.id,
    this.posterPath,
    this.title,
    this.character,
    this.creditId,
  });

  @override
  String toString() {
    return 'Cast(backdropPath: $backdropPath, id: $id, posterPath: $posterPath, title: $title, character: $character, creditId: $creditId)';
  }

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
