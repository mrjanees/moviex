import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/colors/app_color.dart';

void loadingCircle() {
  log('loading started    ');
  Get.dialog(LayoutBuilder(
    builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      double h10p = maxWidth * 0.1;
      return Padding(
        padding: EdgeInsets.only(
          top: h10p * 6,
          bottom: h10p * 6,
          left: h10p * 1.5,
          right: h10p * 1.5,
        ),
        child: Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ELEMENT_COLOR),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    color: ROSE_COLOR,
                    backgroundColor: ELEMENT_COLOR,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Loding...',
                    style: TextStyle(
                        color: WHITE_COLOR,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  )
                ],
              ),
            )),
      );
    },
  ), barrierDismissible: false);
}

hideLoading() {
  if (Get.isDialogOpen!) Get.back(closeOverlays: true);
}
