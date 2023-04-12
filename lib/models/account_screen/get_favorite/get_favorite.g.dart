// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFavorite _$GetFavoriteFromJson(Map<String, dynamic> json) => GetFavorite(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetFavoriteToJson(GetFavorite instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
