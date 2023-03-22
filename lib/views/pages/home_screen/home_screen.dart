import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
import 'package:mspot/controllers/home/home_controllers.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:mspot/views/pages/home_screen/trending/trending_pages.dart';
import 'package:mspot/views/wIdgets/home_screen/category_button.dart';
import 'package:mspot/views/wIdgets/home_screen/slider_image.dart';
import '../../wIdgets/home_screen/page_Indicator.dart';

final controller = CarouselController();
final HomeControllers homecontrollers = Get.put(HomeControllers());

class HomeScreen extends StatelessWidget {
  String? sessionId;
  HomeScreen({super.key, this.sessionId});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxHeight = constraints.maxHeight;
      final maxWidth = constraints.maxWidth;
      double h1p = maxHeight * 0.01;
      double h10p = maxHeight * 0.1;
      double w1p = maxWidth * 0.01;
      double w10p = maxWidth * 0.1;

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: h1p * 3,
                left: w1p * 3,
                right: w1p * 3,
              ),
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/menu.svg',
                      height: 30,
                      width: 30,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                    Image.asset(
                      'assets/icons/App_Icon.png',
                      scale: 3.5,
                    ),
                    SvgPicture.asset(
                      'assets/icons/user.svg',
                      height: 30,
                      width: 30,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: h10p * 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: w1p * 3),
                    child: Text('Upcoming', style: MoviexFontStyle.heading1()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SliderImage(
                    h10p: h10p,
                    h1p: h1p,
                    w10p: w10p,
                    w1p: w1p,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: w10p * 3.6),
                    child: buildIndicator(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: w1p * 3, right: w1p * 3),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trending',
                      style: MoviexFontStyle.heading1(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CategoryButton(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Trending()
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
