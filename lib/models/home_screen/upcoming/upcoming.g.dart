// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Upcoming _$UpcomingFromJson(Map<String, dynamic> json) => Upcoming(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => UpcomingResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpcomingToJson(Upcoming instance) => <String, dynamic>{
      'results': instance.results,
    };
