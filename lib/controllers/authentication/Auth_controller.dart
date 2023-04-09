import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  String loginKey = 'LoginKey';
  var isloggedIn = false.obs;

  @override
  void onInit() {
    isLloggedIn();
    super.onInit();
  }

  void login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool value = await prefs.setBool(loginKey, true);
    isloggedIn.value = value;
  }

  Future<bool> isLloggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return isloggedIn.value = prefs.getBool(loginKey) ?? false;
  }

  void logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool value = await prefs.setBool(loginKey, false);
    isloggedIn.value = value;
  }
}
