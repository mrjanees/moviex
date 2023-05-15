import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/views/wIdgets/movie/generate/select_date.dart';
import 'package:mspot/views/wIdgets/movie/generate/single_choice_chip.dart';

import '../../../../core/colors/app_color.dart';
import '../../../../core/movie_generater/data.dart';

int movieIndex = 0;
void selectLanguage() {
  Get.dialog(
    LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        double h10p = maxWidth * 0.1;
        return Padding(
          padding: EdgeInsets.only(
            top: h10p * 3.5,
            bottom: h10p * 4,
          ),
          child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/background_image/Generate movie list.jpg'))),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          child: Text('Select Language',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: WHITE_COLOR)),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const SingleLanguageChip(),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    backgroundColor: ELEMENT_COLOR,
                                    padding: const EdgeInsets.all(8)),
                                onPressed: () {
                                  Get.back();
                                  log(movieIndex);

                                  selectDate();
                                },
                                child: const Icon(Icons.navigate_next))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )),
        );
      },
    ),
    barrierDismissible: false,
  );
}
