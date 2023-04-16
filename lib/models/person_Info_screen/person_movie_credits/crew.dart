import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable()
class Crew {
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'popularity')
  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'video')
  bool? video;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;
  @JsonKey(name: 'credit_id')
  String? creditId;
  @JsonKey(name: 'department')
  String? department;
  @JsonKey(name: 'job')
  String? job;

  Crew({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.creditId,
    this.department,
    this.job,
  });

  @override
  String toString() {
    return 'Crew(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount, creditId: $creditId, department: $department, job: $job)';
  }

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
