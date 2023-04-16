import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mspot/views/wIdgets/collection/collection_main_card.dart';
import 'package:mspot/views/wIdgets/collection/movie_collections.dart';

import '../../core/Font_style.dart';
import '../../core/colors/app_color.dart';
import 'movie_info_screen.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxheight = constraints.maxHeight;
        double maxWidth = constraints.maxWidth;
        double w1p = constraints.maxWidth * 0.01;
        double h1p = constraints.maxHeight * 0.01;
        double w10p = constraints.maxWidth * 0.1;
        double h10p = constraints.maxHeight * 0.1;
        return SafeArea(
          child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  titleSpacing: w1p * 3,
                  title: Text(
                    'Collection',
                    style: MoviexFontStyle.heading1(),
                  ),
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
              body: SingleChildScrollView(
                child: Obx(
                  () {
                    final mainMovie =
                        movieInfoController.movieCollections.value;

                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: CollectionMainCard(
                                backgroundImg: mainMovie.backdropPath,
                                movieId: mainMovie.id!,
                                h10p: h10p,
                                w10p: w10p,
                                image: mainMovie.posterPath,
                                title: mainMovie.name!,
                                overview: mainMovie.overview!,
                              )),
                          const SizedBox(height: 5),
                          const Divider(
                            color: Color.fromARGB(255, 58, 38, 139),
                            thickness: 1,
                            indent: 10,
                            endIndent: 10,
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: MovieCollextions(),
                          )
                        ]);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
