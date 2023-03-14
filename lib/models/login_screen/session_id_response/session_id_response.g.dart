// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionIdResponse _$SessionIdResponseFromJson(Map<String, dynamic> json) =>
    SessionIdResponse(
      success: json['success'] as bool?,
      sessionId: json['session_id'] as String?,
    );

Map<String, dynamic> _$SessionIdResponseToJson(SessionIdResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'session_id': instance.sessionId,
    };
