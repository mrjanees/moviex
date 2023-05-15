// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_tv_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopRatedTvResult _$TopRatedTvResultFromJson(Map<String, dynamic> json) =>
    TopRatedTvResult(
      firstAirDate: json['first_air_date'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      posterPath: json['poster_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TopRatedTvResultToJson(TopRatedTvResult instance) =>
    <String, dynamic>{
      'first_air_date': instance.firstAirDate,
      'id': instance.id,
      'name': instance.name,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
    };
