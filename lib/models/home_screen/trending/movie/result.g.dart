// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResult _$MovieResultFromJson(Map<String, dynamic> json) => MovieResult(
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      originalTitle: json['original_title'] as String?,
      posterPath: json['poster_path'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      releaseDate: json['release_date'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MovieResultToJson(MovieResult instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'genre_ids': instance.genreIds,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
    };
