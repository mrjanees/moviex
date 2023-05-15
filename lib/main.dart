import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mspot/core/colors/app_color.dart';
import 'package:mspot/core/colors/primary_scwatch.dart';
import 'package:mspot/views/pages/base_screen.dart';
import 'package:mspot/views/pages/collection_screen.dart';
import 'package:mspot/views/pages/login_screen.dart';
import 'package:mspot/views/pages/movie_info_screen.dart';
import 'package:mspot/views/pages/person_info_screen.dart';
import 'package:mspot/views/pages/profile_screen.dart';
import 'package:mspot/views/pages/season_info_screen.dart';
import 'package:mspot/views/pages/seasons_screen.dart';
import 'package:mspot/views/pages/tv_info_screen.dart';
import 'package:mspot/views/wIdgets/movie_info/trailer_video_widg.dart';
import 'controllers/authentication/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: BACKGROUND_COLOR));
  await Get.put(AuthController.instance.isLloggedIn());
 
  runApp(const MyApp());
}

final authController = Get.put(AuthController.instance);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              primarySwatch: moviexPrimaryColor,
              scaffoldBackgroundColor: BACKGROUND_COLOR,
            ),
            initialRoute: authController.isLoggedIn == false ? '/login' : '/',
            getPages: [
              GetPage(name: '/', page: () => BaseScreen()),
              GetPage(name: '/login', page: () => LoginScreen()),
              GetPage(name: '/MovieInfo', page: () => MovieInfoScreen()),
              GetPage(name: '/profile', page: () => const ProfileScreen()),
              GetPage(
                  name: '/collection', page: () => const CollectionScreen()),
              GetPage(
                  name: '/personInfo', page: () => const PersonInfoScreen()),
              GetPage(name: '/TvInfoScreen', page: () => const TvInfoScreen()),
              GetPage(
                  name: '/SeasonsScreen', page: () => const SeasonsScreen()),
              GetPage(
                  name: '/SeasonInfoScreen',
                  page: () => const SeasonInfoScreen()),
                  
            ],
          ),
        ));
  }
}
