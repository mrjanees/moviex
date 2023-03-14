import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mspot/utils/dioerror_message.dart';
import 'package:mspot/models/login_screen/session_id_response/session_id_response.dart';

import '../../../models/login_screen/request_token_response/request_token_response.dart';
import '../../../models/login_screen/session_id_request/session_id_request.dart';
import '../../../models/login_screen/validate_with_login_request/validate_with_login_request.dart';

abstract class AuthenticationRemote {
  Future<Either<DioErrorType, RequestTokenResponse>> requestToken();
  Future<Either<DioErrorType, RequestTokenResponse>> validateWithlogin(
      ValidateWithLoginRequest value);
  Future<Either<DioErrorType, SessionIdResponse>> createSessionId(
      SessionIdRequest value);
}
