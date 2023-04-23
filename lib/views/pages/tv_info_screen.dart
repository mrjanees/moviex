import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:mspot/views/pages/movie_info_screen.dart';
import 'package:mspot/views/wIdgets/movie_info/content_widg.dart';
import 'package:mspot/views/wIdgets/movie_info/main_card_widg.dart';
import 'package:mspot/views/wIdgets/tv_info_screen/series_cast.dart';
import 'package:mspot/views/wIdgets/tv_info_screen/view_all_season.dart';
import '../../controllers/tv_info/tv_info_controller.dart';
import '../../core/colors/app_color.dart';

final tvInfoController = Get.put(TvInfoController.instance);

class TvInfoScreen extends StatelessWidget {
  const TvInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback(
    //     (timeStamp) => Get.put(AccountController.instance.getFavoriteMovie()));
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
                  'Tv Info',
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
            body: SingleChildScrollView(child: Obx(() {
              final tvInfo = tvInfoController.tvInfoData.value;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: MainCard(
                        maxHeight: maxHeight,
                        maxwidth: maxWidth,
                        mediatype: Mediatype.tv,
                        genres: tvInfo.genres!
                            .map((genres) => genres.name)
                            .join(', '),
                        movieId: tvInfo.id!,
                        moviekey: tvInfo.trailerkey,
                        h10p: h10p,
                        w10p: w10p,
                        duration: null,
                        lastAirDate: tvInfo.lastAirDate,
                        image: tvInfo.posterPath,
                        releasedDate: tvInfo.firstAirDate!,
                        title: tvInfo.name!,
                        vote: tvInfo.voteAverage!,
                        tagline: tvInfo.tagline,
                      )),
                  SizedBox(height: h1p * 1),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: ContentTemp(
                      h10p: h10p,
                      w10p: w10p,
                      overview: tvInfo.overview,
                      budget: tvInfo.networks![0].name,
                      revenue: tvInfo.type,
                      status: tvInfo.status,
                      orginalLanguage: tvInfo.originalLanguage,
                      mediatype: Mediatype.tv,
                    ),
                  ),
                  Visibility(
                    visible: tvInfo.createdBy!.isNotEmpty ? true : false,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 20),
                      child: Text(
                        'Created By',
                        style: MoviexFontStyle.heading1(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h10p * .3,
                  ),
                  Visibility(
                    visible: tvInfo.createdBy!.isNotEmpty ? true : false,
                    child: SizedBox(
                        height: h10p * 0.8,
                        child: Obx(
                          () => ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: w10p * 0.3,
                                );
                              },
                              itemCount: tvInfoController
                                  .tvInfoData.value.createdBy!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final creators = tvInfoController
                                    .tvInfoData.value.createdBy![index];
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
                                            creators.name!,
                                            style: const TextStyle(
                                                color: WHITE_COLOR,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text(
                                            'Creater',
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
                  ),
                  SizedBox(
                    height: h10p * .3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Visibility(
                        visible: true,
                        child: ViewAllSeasons(
                            backGround: tvInfo.backdropPath,
                            id: tvInfo.id!,
                            maxWidth: maxWidth,
                            season: tvInfo.numberOfSeasons!,
                            episodes: tvInfo.numberOfEpisodes!,
                            h10p: h10p,
                            w10p: w10p)),
                  ),
                  SizedBox(
                    height: h10p * .3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Series Cast',
                      style: MoviexFontStyle.heading1(),
                    ),
                  ),
                  SizedBox(
                    height: h10p * .1,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SeriesCast(),
                  )
                ],
              );
            })),
          )),
        );
      },
    );
  }
}
