// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_billed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopBilled _$TopBilledFromJson(Map<String, dynamic> json) => TopBilled(
      id: json['id'] as int?,
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopBilledToJson(TopBilled instance) => <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
    };
