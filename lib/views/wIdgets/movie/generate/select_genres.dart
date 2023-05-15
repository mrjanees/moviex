import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/controllers/network/network_connectivity.dart';
import 'package:mspot/controllers/popular_movie/popular_movie.dart';
import 'package:mspot/core/movie_generater/data.dart';
import 'package:mspot/utils/genres_name_to_genres_id.dart';
import 'package:mspot/views/dialogs/loding_circle.dart';
import 'package:mspot/views/wIdgets/movie/generate/multi_choice_chip.dart';
import 'package:mspot/views/wIdgets/movie/generate/select_date.dart';
import 'package:mspot/views/wIdgets/movie/generate/select_language.dart';
import 'package:mspot/views/wIdgets/movie/popular_movie.dart';

import '../../../../core/colors/app_color.dart';
import '../../../../models/popular_movie_screen/generate/movie_generate_model.dart';

void selectGenres() {
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
                            child: Text('Select Genres',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: WHITE_COLOR)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const MultiChoiceChip(),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
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
                                        selectDate();
                                      },
                                      child: const Icon(Icons.navigate_before)),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor: ELEMENT_COLOR,
                                          padding: const EdgeInsets.all(8)),
                                      onPressed: () {
                                        clickToGenerate();
                                      },
                                      child: const Icon(Icons.navigate_next))
                                ],
                              )
                            ],
                          ),
                        ])),
                  )),
            ));
      },
    ),
    barrierDismissible: false,
  );
}

void clickToGenerate() {
  if (network == 'Online') {
    loadingCircle();
    if (initialDate != null && finalDate != null && val.isNotEmpty) {
      final stringInitialDate = initialDate.toString().split(' ')[0];
      final stringFinalDate = finalDate.toString().split(' ')[0];
      final generateDate = MovieGenerateModelLocal.create(
          finalDate: stringFinalDate,
          genres: genresNametoGeresId(val),
          initialDate: stringInitialDate,
          language: GeneratePopUpValues.numberTolanguageCode(movieIndex));
      Get.put(PopularMovieControllers.instance.generatedMovie(
          orginalLanguage: generateDate.language,
          initialDate: generateDate.initialDate,
          finalDate: generateDate.finalDate,
          genres: generateDate.genres));
      log(generateDate.toString());
    }
  }
  initialDate = null;
  finalDate = null;
  val.clear();
}
