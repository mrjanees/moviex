// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestTokenResponse _$RequestTokenResponseFromJson(
        Map<String, dynamic> json) =>
    RequestTokenResponse(
      success: json['success'] as bool?,
      expiresAt: json['expires_at'] as String?,
      requestToken: json['request_token'] as String?,
    );

Map<String, dynamic> _$RequestTokenResponseToJson(
        RequestTokenResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'expires_at': instance.expiresAt,
      'request_token': instance.requestToken,
    };
