import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:mspot/models/login_screen/request_token_response/request_token_response.dart';
import 'package:mspot/models/login_screen/session_id_request/session_id_request.dart';
import 'package:mspot/models/login_screen/session_id_response/session_id_response.dart';
import 'package:mspot/models/login_screen/validate_with_login_request/validate_with_login_request.dart';
import 'package:mspot/services/login_screen_api/authentication_remote/implementation.dart';
import 'package:mspot/utils/dioerror_message.dart';
import '../../views/dialogs/loding_circle.dart';
import '../../views/pages/login_screen.dart';

class LoginControllers extends GetxController {
  static RequestTokenResponse? requestToken;
  RequestTokenResponse? loginvalidation;
  SessionIdResponse? sessionId;

  static Future<String?> loginButton(
      String contrUsername, String contrPassword) async {
    LoginControllers.showLoding();
    await getRequestToken();
    final token = requestToken!.requestToken;
    final username = contrUsername;
    final password = contrPassword;
    if (token!.isNotEmpty && username.isNotEmpty && password.isNotEmpty) {
      final data = ValidateWithLoginRequest.create(
          password: password, requestToken: token, username: username);
      final varifiedTokens = await LoginControllers().validateWithLogin(data);
      if (varifiedTokens.success == true) {
        final requesttoken =
            SessionIdRequest.create(requestToken: varifiedTokens.requestToken);
        final sessionId =
            await LoginControllers().createSessionId(requesttoken);
        if (sessionId.success == true) {
          return sessionId.sessionId;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<void> getRequestToken() async {
    final response = await AuthRemoteImplement().requestToken();
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
    }, (r) {
      return requestToken = r;
    });
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
