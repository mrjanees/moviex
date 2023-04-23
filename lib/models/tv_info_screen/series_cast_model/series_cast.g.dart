// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesCast _$SeriesCastFromJson(Map<String, dynamic> json) => SeriesCast(
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>?)
          ?.map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$SeriesCastToJson(SeriesCast instance) =>
    <String, dynamic>{
      'cast': instance.cast,
      'crew': instance.crew,
      'id': instance.id,
    };
