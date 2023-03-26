// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvResult _$TvResultFromJson(Map<String, dynamic> json) => TvResult(
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      posterPath: json['poster_path'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      firstAirDate: json['first_air_date'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TvResultToJson(TvResult instance) => <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'name': instance.name,
      'poster_path': instance.posterPath,
      'genre_ids': instance.genreIds,
      'first_air_date': instance.firstAirDate,
      'vote_average': instance.voteAverage,
      'origin_country': instance.originCountry,
    };
