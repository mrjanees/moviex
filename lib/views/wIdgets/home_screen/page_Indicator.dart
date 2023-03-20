import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../const/colors/colors.dart';
import '../../../core/internet_images.dart';
import '../../pages/home_screen.dart';

Widget buildIndicator() => Obx(() => AnimatedSmoothIndicator(
      onDotClicked: animateToSlide,
      effect: const ExpandingDotsEffect(
        dotWidth: 8,
        dotHeight: 8,
        activeDotColor: ROSE_COLOR,
        dotColor: WHITE_COLOR,
      ),
      activeIndex: homecontrollers.activeIndex.value,
      count: MoviexImage.upComoingMovieImage.length,
    ));
void animateToSlide(int index) => controller.animateToPage(index);
