import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../core/colors/app_color.dart';

void successSnackbar(String title, String content, IconData icon) {
  Get.snackbar(
    title,
    content,
    icon: Icon(
      icon,
      color: Colors.green,
    ),
    snackPosition: SnackPosition.TOP,
    shouldIconPulse: true,
    backgroundColor: ELEMENT_COLOR,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: Colors.green,
    duration: const Duration(seconds: 4),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
