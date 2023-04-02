import 'package:mspot/const/api_key.dart';

final Uri signUpUrl = Uri.parse('https://www.themoviedb.org/signup');

class AuthenticationUrls {
  static String requestToken =
      "https://api.themoviedb.org/3/authentication/token/new?api_key=$apiKey";
  static String validateWIthLogin =
      "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=$apiKey";
  static String createSession =
      "https://api.themoviedb.org/3/authentication/session/new?api_key=$apiKey";
}
