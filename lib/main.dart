import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mspot/controllers/home/trending/trending.dart';

import 'package:mspot/core/colors/app_color.dart';
import 'package:mspot/views/pages/base_screen.dart';
import 'package:mspot/views/pages/collection_screen.dart';
import 'package:mspot/views/pages/login_screen.dart';
import 'package:mspot/views/pages/movie_info_screen.dart';
import 'package:mspot/views/pages/profile_screen.dart';

import 'controllers/authentication/Auth_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: BACKGROUND_COLOR));
  Get.put(AuthController());
  runApp(MyApp());
}

final authController = Get.put(AuthController());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: BACKGROUND_COLOR,
            ),
            initialRoute:
                authController.isloggedIn.value == false ? '/login' : '/',
            getPages: [
              GetPage(name: '/', page: () => BaseScreen()),
              GetPage(name: '/login', page: () => LoginScreen()),
              GetPage(name: '/MovieInfo', page: () => MovieInfoScreen()),
              GetPage(name: '/profile', page: () => const ProfileScreen()),
              GetPage(
                  name: '/collection', page: () => const CollectionScreen()),
            ],
          ),
        ));
  }
}
