// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonInfo _$SeasonInfoFromJson(Map<String, dynamic> json) => SeasonInfo(
      id: json['_id'] as String?,
      airDate: json['air_date'] as String?,
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      tvId: json['id'] as int?,
      posterPath: json['poster_path'] as String?,
      seasonNumber: json['season_number'] as int?,
    );

Map<String, dynamic> _$SeasonInfoToJson(SeasonInfo instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'air_date': instance.airDate,
      'episodes': instance.episodes,
      'name': instance.name,
      'overview': instance.overview,
      'id': instance.tvId,
      'poster_path': instance.posterPath,
      'season_number': instance.seasonNumber,
    };
