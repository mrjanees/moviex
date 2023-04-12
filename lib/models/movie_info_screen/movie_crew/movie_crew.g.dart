// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCrew _$MovieCrewFromJson(Map<String, dynamic> json) => MovieCrew(
      crew: (json['crew'] as List<dynamic>?)
          ?.map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieCrewToJson(MovieCrew instance) => <String, dynamic>{
      'crew': instance.crew,
    };
