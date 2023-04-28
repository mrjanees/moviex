import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mspot/controllers/home/home_controllers.dart';
import 'package:mspot/controllers/home/trending/trending.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:mspot/core/colors/app_color.dart';
import 'package:mspot/main.dart';
import 'package:mspot/views/pages/home_screen/trending/trending_pages.dart';
import 'package:mspot/views/wIdgets/home_screen/category_button.dart';
import 'package:mspot/views/wIdgets/home_screen/slider_image.dart';
import 'package:mspot/views/wIdgets/search_screen/appbar_title.dart';
import '../../wIdgets/home_screen/page_Indicator.dart';

final controller = CarouselController();
final homecontrollers = Get.put(HomeControllers());

class HomeScreen extends StatelessWidget {
  String? sessionId;
  HomeScreen({super.key, this.sessionId});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxHeight = constraints.maxHeight;
      final maxWidth = constraints.maxWidth;
      print(maxHeight);
      print(maxWidth);
      double h1p = maxHeight * 0.01;
      double h10p = maxHeight * 0.1;
      double w1p = maxWidth * 0.01;
      double w10p = maxWidth * 0.1;

      return RefreshIndicator(
        onRefresh: () async {
          TrendingController.instance.onInit();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: maxWidth,
                height: maxHeight / 2.65,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.5,
                      image: AssetImage(
                          'assets/background_image/HomwscreenTemp.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, right: 10),
                          child: AppbarTitle(),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.toNamed('/profile');
                            },
                            icon: SvgPicture.asset(
                              'assets/icons/user.svg',
                              height: 30,
                              width: 30,
                              colorFilter: const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AnimatedTextKit(
                              repeatForever: false,
                              isRepeatingAnimation: false,
                              animatedTexts: [
                                TyperAnimatedText('Welcome',
                                    textStyle:
                                        MoviexFontStyle.homeScreenAnimH1(),
                                    speed: const Duration(milliseconds: 200)),
                              ]),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Container(
                            width: maxWidth - 20,
                            height: 100,
                            child: AnimatedTextKit(
                                repeatForever: false,
                                isRepeatingAnimation: false,
                                animatedTexts: [
                                  TyperAnimatedText(
                                      'Millions of movies, TV shows and people to discover. Explore now.',
                                      textStyle:
                                          MoviexFontStyle.homeScreenAnimH2(),
                                      speed: const Duration(milliseconds: 100)),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                      child:
                          Text('Upcoming', style: MoviexFontStyle.heading1()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SliderImage(
                      maxWidth: maxWidth,
                      h10p: h10p,
                      h1p: h1p,
                      w10p: w10p,
                      w1p: w1p,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: maxWidth / 4),
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
        ),
      );
    });
  }
}
