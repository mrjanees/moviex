import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../const/colors/colors.dart';

void errorSnackbar(String title, String content, IconData icon) {
  Get.snackbar(
    title,
    content,
    icon: Icon(icon, color: Colors.white),
    snackPosition: SnackPosition.TOP,
    backgroundColor: BACKGROUND_COLOR,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: Colors.white,
    duration: const Duration(seconds: 4),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
