import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mspot/controllers/home/trending/trending.dart';

import 'package:mspot/core/colors/app_color.dart';
import 'package:mspot/views/pages/login_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: BACKGROUND_COLOR));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: BACKGROUND_COLOR,
      ),
      home: LoginScreen(),
    );
  }
}
