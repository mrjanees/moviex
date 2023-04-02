// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => PersonResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
