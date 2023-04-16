// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      name: json['name'] as String?,
      key: json['key'] as String?,
      type: json['type'] as String?,
      official: json['official'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'type': instance.type,
      'official': instance.official,
      'id': instance.id,
    };
