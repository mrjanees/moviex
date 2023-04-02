// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tv _$TvFromJson(Map<String, dynamic> json) => Tv(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => TvResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TvToJson(Tv instance) => <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
