// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_collections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCollections _$MovieCollectionsFromJson(Map<String, dynamic> json) =>
    MovieCollections(
      id: json['id'] as int?,
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      parts: (json['parts'] as List<dynamic>?)
          ?.map((e) => Part.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieCollectionsToJson(MovieCollections instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'parts': instance.parts,
    };
