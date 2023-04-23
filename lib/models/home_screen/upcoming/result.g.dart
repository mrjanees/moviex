// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingResult _$UpcomingResultFromJson(Map<String, dynamic> json) =>
    UpcomingResult(
      id: json['id'] as int?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
    )..backdropPath = json['backdrop_path'] as String?;

Map<String, dynamic> _$UpcomingResultToJson(UpcomingResult instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
    };
