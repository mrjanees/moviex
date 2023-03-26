// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

All _$AllFromJson(Map<String, dynamic> json) => All(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => AllResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$AllToJson(All instance) => <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
