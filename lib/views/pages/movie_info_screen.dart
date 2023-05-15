import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mspot/controllers/movie_info/movie_info_controller.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:mspot/views/wIdgets/movie_info/collection_widg.dart';
import 'package:mspot/views/wIdgets/movie_info/content_widg.dart';
import 'package:mspot/views/wIdgets/movie_info/main_card_widg.dart';
import 'package:mspot/views/wIdgets/movie_info/top_billed_widg.dart';
import '../../controllers/account/controller.dart';
import '../../controllers/network/network_connectivity.dart';
import '../../controllers/person_info/person_info_controller.dart';
import '../../core/colors/app_color.dart';
import '../../utils/dioerror_message.dart';

final movieInfoController = Get.put(MovieInfoController.instance);

class MovieInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => Get.put(AccountController.instance.getFavoriteMovie()));
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxHeight = constraints.maxHeight;
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
                          maxHeight: maxHeight,
                          mediatype: Mediatype.movie,
                          maxwidth: maxWidth,
                          genres: movie.genres!
                              .map((genres) => genres.name)
                              .join(', '),
                          movieId: movie.id!,
                          moviekey: movie.key,
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
                        mediatype: Mediatype.movie,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Crew', style: MoviexFontStyle.heading1()),
                    ),
                   const  SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        height: 50,
                        child: Obx(
                          () => ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: w10p * 0.3,
                                );
                              },
                              itemCount:
                                  movieInfoController.movieCrewList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final movieCrew =
                                    movieInfoController.movieCrewList[index];

                                return GestureDetector(
                                  onTap: () {
                                    if (network == 'Online') {
                                      Get.put(PersonInfoController.instance
                                          .personInfo(movieCrew.id!));
                                    } else {
                                      DioErrorTypeMessage.toShowErrorMessage(
                                          DioErrorType.unknown);
                                    }
                                  },
                                  child: Container(
                                    width: w10p * 5,
                                    decoration: BoxDecoration(
                                        color: ELEMENT_COLOR,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                        child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                              movieCrew.name!,
                                              style: const TextStyle(
                                                  color: WHITE_COLOR,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              movieCrew.job!,
                                              style: const TextStyle(
                                                  color: WHITE_COLOR,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ],
                                    )),
                                  ),
                                );
                              }),
                        )),
                   const  SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                        visible:
                            movie.belongsToCollection == null ? false : true,
                        child: CollectionWidg(
                          h10p: h10p,
                          w10p: w10p,
                          maxWidth: maxWidth,
                          collection: movie.belongsToCollection,
                          movieCollectionNames:
                              movieInfoController.movieCollectionName.value,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        'Top Billed',
                        style: MoviexFontStyle.heading1(),
                      ),
                    ),
                    SizedBox(
                      height: h10p * .1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
