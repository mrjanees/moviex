import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  String loginKey = 'LoginKey';
  final _isloggedIn = false.obs;
  bool get isLoggedIn => _isloggedIn.value;

  AuthController.internal();
  static AuthController instance = AuthController.internal();
  AuthController factory() {
    return instance;
  }

  void login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isloggedIn.value = await prefs.setBool(loginKey, true);
    print(isLoggedIn);
  }

  Future<void> isLloggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isloggedIn.value = prefs.getBool(loginKey) ?? false;
    print(isLoggedIn);
  }

  void logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool value = await prefs.setBool(loginKey, false);
    _isloggedIn.value = value;
  }
}
