import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mspot/models/login_screen/validate_with_login_request/validate_with_login_request.dart';
import 'package:mspot/utils/dioerror_message.dart';

import 'package:mspot/services/login_screen_api/authentication_remote/authentication_remote.dart';
import 'package:mspot/services/urls/login_screen_url.dart';

import '../../../models/login_screen/request_token_response/request_token_response.dart';
import '../../../models/login_screen/session_id_request/session_id_request.dart';
import '../../../models/login_screen/session_id_response/session_id_response.dart';

final dio = Dio();

class AuthRemoteImplement extends AuthenticationRemote {
  @override
  Future<Either<DioErrorType, SessionIdResponse>> createSessionId(
      SessionIdRequest value) async {
    try {
      final responnse = await dio.post(AuthenticationUrls.createSession,
          data: value.toJson());
      final data = responnse.data;
      return Right(SessionIdResponse.fromJson(data));
    } on DioError catch (e) {
      return Left(e.type);
    }
  }

  @override
  Future<Either<DioErrorType, RequestTokenResponse>> requestToken() async {
    try {
      final response = await dio.get(AuthenticationUrls.requestToken);

      return Right(RequestTokenResponse.fromJson(response.data));
    } on DioError catch (e) {
      print(e.type);
      return Left(e.type);
    }
  }

  @override
  Future<Either<DioErrorType, RequestTokenResponse>> validateWithlogin(
      ValidateWithLoginRequest value) async {
    try {
      final response = await dio.post(AuthenticationUrls.validateWIthLogin,
          data: value.toJson());
      final data = response.data;

      return Right(RequestTokenResponse.fromJson(data));
    } on DioError catch (e) {
      print(e);
      return Left(e.type);
    }
  }
}
