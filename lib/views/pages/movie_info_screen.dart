import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mspot/controllers/movie_info/movie_info_controller.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:mspot/models/movie_info_screen/movie_info/movie_info.dart';

import 'package:mspot/views/wIdgets/movie_info/collection_widg.dart';
import 'package:mspot/views/wIdgets/movie_info/content_widg.dart';
import 'package:mspot/views/wIdgets/movie_info/main_card_widg.dart';
import 'package:mspot/views/wIdgets/movie_info/top_billed_widg.dart';

import '../../core/colors/app_color.dart';

final movieInfoController = Get.put(MovieInfoController.instance);

class MovieInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
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
                  'Movie Info',
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
              child: Obx(() {
                final movie = movieInfoController.movieInfoData.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: MainCard(
                          moviekey: movie.key!,
                          h10p: h10p,
                          w10p: w10p,
                          duration: movie.runtime!,
                          image: movie.posterPath,
                          releasedDate: movie.releaseDate!,
                          title: movie.title!,
                          vote: movie.voteAverage!,
                        )),
                    SizedBox(height: h1p * 1),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: ContentTemp(
                        h10p: h10p,
                        w10p: w10p,
                        overview: movie.overview,
                        budget: movie.budget.toString(),
                        revenue: movie.revenue.toString(),
                        status: movie.status,
                        orginalLanguage: movie.originalLanguage,
                      ),
                    ),
                    SizedBox(
                      height: h10p * .3,
                    ),
                    SizedBox(
                        height: h10p * 0.8,
                        child: Obx(
                          () => ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: w10p * 0.3,
                                );
                              },
                              itemCount: movieInfoController.creators.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final creator =
                                    movieInfoController.creators[index];
                                return Container(
                                  width: w10p * 5,
                                  decoration: BoxDecoration(
                                      color: ELEMENT_COLOR,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                      child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: w10p * 0.5,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            creator.name!,
                                            style: TextStyle(
                                                color: WHITE_COLOR,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            creator.job!,
                                            style: TextStyle(
                                                color: WHITE_COLOR,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                                );
                              }),
                        )),
                    SizedBox(
                      height: h10p * .3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CollectionWidg(
                          h10p: h10p, w10p: w10p, maxWidth: maxWidth),
                    ),
                    SizedBox(
                      height: h10p * .3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Top Billed',
                        style: MoviexFontStyle.heading1(),
                      ),
                    ),
                    SizedBox(
                      height: h10p * .1,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TopBilled(),
                    )
                  ],
                );
              }),
            ),
          )),
        );
      },
    );
  }
}
