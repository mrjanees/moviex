import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mspot/core/colors/app_color.dart';
import 'package:mspot/views/wIdgets/movie/generate/select_language.dart';

import '../../core/Font_style.dart';
import '../wIdgets/search_screen/appbar_title.dart';
import '../wIdgets/movie/popular_movie.dart';

class TvScreen extends StatelessWidget {
  TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxHeight = constraints.maxHeight;
      final maxWidth = constraints.maxWidth;
      double h1p = maxHeight * 0.01;

      double w1p = maxWidth * 0.01;
      return NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  titleSpacing: w1p * 3,
                  title: const AppbarTitle(),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Get.toNamed('/profile');
                        },
                        icon: SvgPicture.asset(
                            height: 30,
                            width: 30,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                            'assets/icons/user.svg'))
                  ],
                  automaticallyImplyLeading: false,
                  backgroundColor: BACKGROUND_COLOR,
                  floating: true,
                  snap: true,
                )
              ],
          body: Padding(
            padding:
                EdgeInsets.only(left: w1p * 3, right: w1p * 3, top: h1p * 2),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: maxWidth - 16,
                    height: 210,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(54, 0, 0, 0),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                'assets/background_image/profile.jpg'))),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Generate Movie List',
                              style: MoviexFontStyle.homeScreenAnimH1(),
                            ),
                            SizedBox(
                              width: 300,
                              height: 95,
                              child: AnimatedTextKit(
                                  repeatForever: false,
                                  isRepeatingAnimation: false,
                                  animatedTexts: [
                                    TyperAnimatedText(
                                        'If You you have no Idea Which Movies You to Watch. Generate Movie List Based On Your Likes... ',
                                        textStyle:
                                            MoviexFontStyle.homeScreenAnimH3(),
                                        speed:
                                            const Duration(milliseconds: 100)),
                                  ]),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 40,
                                  child: Center(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            backgroundColor: ELEMENT_COLOR,
                                            padding: const EdgeInsets.all(8)),
                                        onPressed: () {
                                          selectLanguage();
                                        },
                                        child: const Text(
                                          'Generate',
                                          style: TextStyle(
                                              color: WHITE_COLOR, fontSize: 16),
                                        )),
                                  ),
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    popularMoviController.generatedMovieList.isEmpty
                        ? 'Popular Movie'
                        : 'Generated Movie',
                    style: MoviexFontStyle.heading1(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  PopularMovie()
                ],
              ),
            ),
          ));
    });
  }
}
