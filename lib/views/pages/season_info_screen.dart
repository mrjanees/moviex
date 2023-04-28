import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mspot/views/wIdgets/season_info.dart/all_episodes.dart';

import '../../controllers/tv_info/season_info_controller.dart';
import '../../core/Font_style.dart';
import '../../core/colors/app_color.dart';
import '../wIdgets/season_info.dart/main_card.dart';

final seasonInfoController = Get.put(SeasonInfoController.instance);

class SeasonInfoScreen extends StatelessWidget {
  const SeasonInfoScreen({super.key});

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
                    'Season Info',
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
                final seasonInfoData =
                    seasonInfoController.seasonInfoData.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: SeasonInfoMainCard(
                          backgroundImg: seasonInfoData.posterPath,
                          movieId: seasonInfoData.tvId!,
                          h10p: h10p,
                          w10p: w10p,
                          image: seasonInfoData.posterPath,
                          title: seasonInfoData.name!,
                          overview: seasonInfoData.overview!,
                        )),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AllEpisodes(),
                    )
                  ],
                );
              })),
            ),
          ),
        );
      },
    );
  }
}
