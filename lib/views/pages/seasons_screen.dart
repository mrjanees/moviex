import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mspot/views/wIdgets/seasons/all_season.dart';

import '../../core/Font_style.dart';
import '../../core/colors/app_color.dart';

class SeasonsScreen extends StatelessWidget {
  const SeasonsScreen({super.key});

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
                    'Seasons',
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AllSeasons(),
                    )
                  ])),
            ),
          ),
        );
      },
    );
  }
}
