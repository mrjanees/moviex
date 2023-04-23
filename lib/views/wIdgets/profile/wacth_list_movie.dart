import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/views/pages/profile_screen.dart';
import 'package:mspot/views/wIdgets/common/movie_card_template.dart';
import 'package:mspot/views/wIdgets/profile/profile_card.dart';

class WatchlistMovie extends StatelessWidget {
  const WatchlistMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Obx(() => ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            final watchList = accountController.watchMovieList[index];
            return ProfileCard(
                movieId: watchList.id!,
                heading: watchList.title!,
                image: watchList.posterPath,
                relDate: watchList.releaseDate,
                vote: watchList.voteAverage!);
          }),
          separatorBuilder: ((context, index) {
            return const SizedBox(
              width: 10,
            );
          }),
          itemCount: accountController.watchMovieList.length)),
    );
  }
}
