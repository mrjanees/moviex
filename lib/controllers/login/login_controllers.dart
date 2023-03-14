import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mspot/const/colors/colors.dart';
import 'package:mspot/models/login_screen/request_token_response/request_token_response.dart';
import 'package:mspot/models/login_screen/session_id_request/session_id_request.dart';
import 'package:mspot/models/login_screen/session_id_response/session_id_response.dart';
import 'package:mspot/models/login_screen/validate_with_login_request/validate_with_login_request.dart';

import 'package:mspot/services/login_screen_api/authentication_remote/implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:mspot/utils/dioerror_message.dart';
import 'package:mspot/views/pages/home_screen.dart';
import 'package:mspot/views/wIdgets/dialogs/loding_circle.dart';
import 'package:mspot/views/wIdgets/dialogs/success_snackbar.dart';

import '../../views/pages/login_screen.dart';

class LoginControllers {
  RequestTokenResponse? requestToken;
  RequestTokenResponse? loginvalidation;
  SessionIdResponse? sessionId;

  static Future<String?> loginButton() async {
    LoginControllers.showLoding();
    final requestTocken = await LoginControllers().getRequestToken();
    final username = usernameController.text;
    final password = passwordController.text;
    final tocken = requestTocken.requestToken;
    usernameController.clear();
    passwordController.clear();
    final data = ValidateWithLoginRequest.create(
        password: password, requestToken: tocken, username: username);
    final varifiedTokens = await LoginControllers().validateWithLogin(data);
    if (varifiedTokens.success != true) {}

    if (varifiedTokens.success == true) {
      final requesttoken =
          SessionIdRequest.create(requestToken: varifiedTokens.requestToken);
      final sessionId = await LoginControllers().createSessionId(requesttoken);
      if (sessionId.success == true) {
        return sessionId.sessionId;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<RequestTokenResponse> getRequestToken() async {
    final response = await AuthRemoteImplement().requestToken();
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
    }, (r) {
      return requestToken = r;
    });
    return requestToken!;
  }

  Future<RequestTokenResponse> validateWithLogin(
      ValidateWithLoginRequest value) async {
    final response = await AuthRemoteImplement().validateWithlogin(value);
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
    }, (r) {
      return loginvalidation = r;
    });

    return loginvalidation!;
  }

  Future<SessionIdResponse> createSessionId(SessionIdRequest value) async {
    final response = await AuthRemoteImplement().createSessionId(value);
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
    }, (r) {
      return sessionId = r;
    });

    return sessionId!;
  }

  static showLoding() {
    loadingCircle();
  }

  static hideLoading() {
    if (Get.isDialogOpen!) Get.back(closeOverlays: true);
  }
}
