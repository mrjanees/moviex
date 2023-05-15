import 'dart:developer';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mspot/const/screen_type.dart';
import '../../../controllers/home/trending/trending.dart';
import '../../../core/Font_style.dart';
import '../../wIdgets/home_screen/category_button.dart';
import '../../wIdgets/home_screen/page_Indicator.dart';
import '../../wIdgets/home_screen/slider_image.dart';
import '../../wIdgets/search_screen/appbar_title.dart';
import '../home_screen/trending/trending_pages.dart';

class HomeScreenLS extends StatelessWidget {
  const HomeScreenLS({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxHeight = constraints.maxHeight;
      final maxWidth = constraints.maxWidth;
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
                height: maxHeight / 1.5,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Container(
                            width: maxWidth - 20,
                            height: 80,
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
              Column(
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
                    maxWidth: maxWidth,
                    h10p: h10p,
                    h1p: h1p,
                    w10p: w10p,
                    w1p: w1p,
                    screenMode: ScreenMode.landscape,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: maxWidth / 2.8),
                    child: buildIndicator(),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
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
