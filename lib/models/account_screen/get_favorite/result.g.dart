// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'vote_average': instance.voteAverage,
    };
