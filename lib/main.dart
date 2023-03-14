import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mspot/const/colors/colors.dart';
import 'package:mspot/controllers/routing.dart';
import 'package:mspot/views/pages/login_screen.dart';

void main() {
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
      home: const LoginScreen(),
    );
  }
}
