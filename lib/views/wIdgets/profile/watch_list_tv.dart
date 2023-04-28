import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/views/wIdgets/profile/profile_card.dart';

import '../../pages/profile_screen.dart';

class WatchlistTv extends StatelessWidget {
  const WatchlistTv({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Obx(() => ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            final watchList = accountController.tvWatchList[index];
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
          itemCount: accountController.tvWatchList.length)),
    );
  }
}
