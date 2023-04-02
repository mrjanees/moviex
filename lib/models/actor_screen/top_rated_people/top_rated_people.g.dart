// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopRatedPeople _$TopRatedPeopleFromJson(Map<String, dynamic> json) =>
    TopRatedPeople(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
    );

Map<String, dynamic> _$TopRatedPeopleToJson(TopRatedPeople instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
    };
