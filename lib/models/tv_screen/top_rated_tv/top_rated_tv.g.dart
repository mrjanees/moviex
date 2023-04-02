// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_tv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopRatedTv _$TopRatedTvFromJson(Map<String, dynamic> json) => TopRatedTv(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => TopRatedTvResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
    );

Map<String, dynamic> _$TopRatedTvToJson(TopRatedTv instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
    };
