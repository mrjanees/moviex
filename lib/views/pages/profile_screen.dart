import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mspot/controllers/account/controller.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:mspot/core/colors/app_color.dart';
import 'package:mspot/main.dart';
import 'package:mspot/views/wIdgets/profile/favorite_movie.dart';
import 'package:mspot/views/wIdgets/profile/favorite_tv.dart';
import 'package:mspot/views/wIdgets/profile/wacth_list_movie.dart';
import 'package:get/get.dart';
import 'package:mspot/views/wIdgets/profile/watch_list_tv.dart';
import 'package:mspot/views/wIdgets/search_screen/appbar_title.dart';

final accountController = Get.put(AccountController.instance);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Get.put(AccountController.instance);
    });
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
                          top: 30,
                          left: 20,
                          right: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const AppbarTitle(),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        backgroundColor: ELEMENT_COLOR,
                                        title: const Text(
                                          'Log out?',
                                          style: TextStyle(
                                              color: WHITE_COLOR,
                                              fontFamily: 'Inter'),
                                        ),
                                        content: const Text(
                                          'Are you Sure want to Log out ?',
                                          style: TextStyle(
                                              color: WHITE_COLOR,
                                              fontFamily: 'Inter'),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(true),
                                            child: const Text('No',
                                                style: TextStyle(
                                                    color: WHITE_COLOR,
                                                    fontFamily: 'Inter')),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              authController.logOut();
                                              Get.offAllNamed('/Login');
                                            },
                                            child: const Text('Yes',
                                                style: TextStyle(
                                                    color: WHITE_COLOR,
                                                    fontFamily: 'Inter')),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  icon: SvgPicture.asset(
                                      height: 30,
                                      width: 30,
                                      colorFilter: const ColorFilter.mode(
                                          Colors.white, BlendMode.srcIn),
                                      'assets/icons/log-out.svg'))
                            ],
                          )),
                      const Positioned(
                          top: 200,
                          child: ProfilePicture(
                            name: 'Janees',
                            radius: 60,
                            fontsize: 40,
                          ))
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
                const WatchlistMovie(),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Favorite Tv',
                    style: MoviexFontStyle.heading1(),
                  ),
                ),
                const SizedBox(height: 10),
                const FavoriteTv(),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Watchlist Tv',
                    style: MoviexFontStyle.heading1(),
                  ),
                ),
                const SizedBox(height: 10),
                const WatchlistTv()
              ]),
        ),
      );
    });
  }
}
