import 'package:json_annotation/json_annotation.dart';

part 'part.g.dart';

@JsonSerializable()
class Part {
  @JsonKey(name: 'genre_ids')
  List<int>? genreId;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'vote_average')
  double? voteAverage;

  Part({
    this.genreId,
    this.id,
    this.title,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
  });

  @override
  String toString() {
    return 'Part(id: $id, title: $title, posterPath: $posterPath, releaseDate: $releaseDate, voteAverage: $voteAverage )';
  }

  factory Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);

  Map<String, dynamic> toJson() => _$PartToJson(this);
}
