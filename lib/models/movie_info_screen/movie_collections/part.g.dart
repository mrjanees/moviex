// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Part _$PartFromJson(Map<String, dynamic> json) => Part(
      genreId:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      id: json['id'] as int?,
      title: json['title'] as String?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PartToJson(Part instance) => <String, dynamic>{
      'genre_ids': instance.genreId,
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
    };
