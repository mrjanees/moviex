import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mspot/core/colors/app_color.dart';

import '../../core/Font_style.dart';
import '../wIdgets/search_screen/appbar_title.dart';
import '../wIdgets/tv_screen/toprated_tv_template.dart';

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
                        onPressed: () {},
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
                  Text(
                    'Top Rated',
                    style: MoviexFontStyle.heading1(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TopRatedTvTemplate()
                ],
              ),
            ),
          ));
    });
  }
}
