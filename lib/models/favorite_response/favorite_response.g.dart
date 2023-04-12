// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteResponse _$FavoriteResponseFromJson(Map<String, dynamic> json) =>
    FavoriteResponse(
      success: json['success'] as bool?,
      statusCode: json['status_code'] as int?,
      statusMessage: json['status_message'] as String?,
    );

Map<String, dynamic> _$FavoriteResponseToJson(FavoriteResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };
