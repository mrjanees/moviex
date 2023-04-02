// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'known_for.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnownFor _$KnownForFromJson(Map<String, dynamic> json) => KnownFor(
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      posterPath: json['poster_path'] as String?,
      mediaType: json['media_type'] as String?,
    );

Map<String, dynamic> _$KnownForToJson(KnownFor instance) => <String, dynamic>{
      'id': instance.id,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'media_type': instance.mediaType,
    };
