import 'package:flutter/material.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:mspot/core/colors/app_color.dart';
import 'package:mspot/views/wIdgets/profile/favorite_movie.dart';
import 'package:mspot/views/wIdgets/profile/wacth_list_movie.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double h10p = constraints.maxHeight * 0.1;
      double w10p = constraints.maxWidth * 0.1;
      double h1p = constraints.maxHeight * 0.01;
      double w1p = constraints.maxWidth * 0.01;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                          width: 360,
                          height: 260,
                          decoration: BoxDecoration(
                              color: ELEMENT_COLOR,
                              borderRadius: BorderRadius.circular(60)),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: Image.asset(
                              'assets/background_image/profile.jpg',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 200,
                        child: CircleAvatar(
                          radius: h10p,
                          backgroundColor: ROSE_COLOR,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 140),
                  child: Column(
                    children: [
                      Text(
                        'Janees ',
                        style: MoviexFontStyle.heading2(),
                      ),
                      Text(
                        'India',
                        style: MoviexFontStyle.textUnderHeading2(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Favorite Movie',
                    style: MoviexFontStyle.heading1(),
                  ),
                ),
                const SizedBox(height: 10),
                const FavoriteMovie(),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Watchlist Movie',
                    style: MoviexFontStyle.heading1(),
                  ),
                ),
                const SizedBox(height: 10),
                const WatchlistMovie()
              ]),
        ),
      );
    });
  }
}
