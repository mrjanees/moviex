// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trailer_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrailerVideo _$TrailerVideoFromJson(Map<String, dynamic> json) => TrailerVideo(
      id: json['id'] as int?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrailerVideoToJson(TrailerVideo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };
