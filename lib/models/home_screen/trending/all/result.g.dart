// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllResult _$AllResultFromJson(Map<String, dynamic> json) => AllResult(
      firstAirDate: json['first_air_date'] as String?,
      name: json['name'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      releaseDate: json['release_date'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      mediaType: json['media_type'] as String?,
    );

Map<String, dynamic> _$AllResultToJson(AllResult instance) => <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'genre_ids': instance.genreIds,
      'release_date': instance.releaseDate,
      'first_air_date': instance.firstAirDate,
      'vote_average': instance.voteAverage,
      'media_type': instance.mediaType,
    };
