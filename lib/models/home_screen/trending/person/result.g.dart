// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonResult _$PersonResultFromJson(Map<String, dynamic> json) => PersonResult(
      id: json['id'] as int?,
      name: json['name'] as String?,
      knownForDepartment: json['known_for_department'] as String?,
      profilePath: json['profile_path'] as String?,
      knownFor: (json['known_for'] as List<dynamic>?)
          ?.map((e) => KnownFor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PersonResultToJson(PersonResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'known_for_department': instance.knownForDepartment,
      'profile_path': instance.profilePath,
      'known_for': instance.knownFor,
    };
