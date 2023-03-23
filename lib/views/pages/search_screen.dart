import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:mspot/views/wIdgets/search_screen/toprated_search_tempate.dart';
import '../../core/colors/app_color.dart';
import '../wIdgets/search_screen/app_bar_search.dart';
import '../wIdgets/search_screen/appbar_title.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxHeight = constraints.maxHeight;
      final maxWidth = constraints.maxWidth;
      double h1p = maxHeight * 0.01;

      double w1p = maxWidth * 0.01;

      return Scaffold(
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      titleSpacing: w1p * 3,
                      title: const AppbarTitle(),
                      expandedHeight: 120,
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
                      flexibleSpace: FlexibleSpaceBar(
                        background: Padding(
                          padding: EdgeInsets.only(
                              top: 60, right: w1p * 3, left: w1p * 3),
                          child:
                              const SizedBox(width: 100, child: AppbarSearch()),
                        ),
                      ),
                    )
                  ],
              body: Padding(
                padding: EdgeInsets.only(
                    left: w1p * 3, right: w1p * 3, top: h1p * 2),
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
                      const TopRatedSearchTemplate()
                    ],
                  ),
                ),
              )),
        ),
      );
    });
  }
}
