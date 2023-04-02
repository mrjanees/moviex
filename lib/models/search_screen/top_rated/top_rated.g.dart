// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopRated _$TopRatedFromJson(Map<String, dynamic> json) => TopRated(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => TopRatedResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopRatedToJson(TopRated instance) => <String, dynamic>{
      'results': instance.results,
    };
