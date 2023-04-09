import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/colors/app_color.dart';

void errorSnackbar(String title, String content, IconData icon, int second) {
  Get.snackbar(title, content,
      icon: Icon(icon, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      backgroundColor: ELEMENT_COLOR,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: second),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      overlayBlur: 0.5);
}
