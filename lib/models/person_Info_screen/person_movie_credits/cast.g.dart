// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cast _$CastFromJson(Map<String, dynamic> json) => Cast(
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      posterPath: json['poster_path'] as String?,
      title: json['title'] as String?,
      character: json['character'] as String?,
      creditId: json['credit_id'] as String?,
    );

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'poster_path': instance.posterPath,
      'title': instance.title,
      'character': instance.character,
      'credit_id': instance.creditId,
    };
