import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'belongs_to_collection.dart';
import 'genre.dart';

part 'movie_info.g.dart';

@JsonSerializable()
class MovieInfo {
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  BelongsToCollection? belongsToCollection;
  @JsonKey(name: 'budget')
  int? budget;
  @JsonKey(name: 'genres')
  List<Genre>? genres;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'popularity')
  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'revenue')
  int? revenue;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'tagline')
  String? tagline;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;
  @JsonKey(name: 'runtime')
  int? runtime;
  @JsonKey(name: 'key')
  String? key;

  MovieInfo(
      {this.runtime,
      this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.revenue,
      this.status,
      this.tagline,
      this.title,
      this.voteAverage,
      this.voteCount,
      this.key});

  @override
  String toString() {
    return 'MovieInfo(adult: $adult, backdropPath: $backdropPath, belongsToCollection: $belongsToCollection, budget: $budget, genres: $genres, id: $id,originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, revenue: $revenue, status: $status, tagline: $tagline, title: $title,  voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  factory MovieInfo.fromJson(Map<String, dynamic> json) {
    return _$MovieInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieInfoToJson(this);
}
