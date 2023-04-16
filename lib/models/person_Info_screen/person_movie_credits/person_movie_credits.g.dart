// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_movie_credits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonMovieCredits _$PersonMovieCreditsFromJson(Map<String, dynamic> json) =>
    PersonMovieCredits(
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>?)
          ?.map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$PersonMovieCreditsToJson(PersonMovieCredits instance) =>
    <String, dynamic>{
      'cast': instance.cast,
      'crew': instance.crew,
      'id': instance.id,
    };
