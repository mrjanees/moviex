// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_with_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateWithLoginRequest _$ValidateWithLoginRequestFromJson(
        Map<String, dynamic> json) =>
    ValidateWithLoginRequest(
      username: json['username'] as String?,
      password: json['password'] as String?,
      requestToken: json['request_token'] as String?,
    );

Map<String, dynamic> _$ValidateWithLoginRequestToJson(
        ValidateWithLoginRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'request_token': instance.requestToken,
    };
