import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/views/wIdgets/profile/profile_card.dart';
import '../../pages/profile_screen.dart';

class FavoriteTv extends StatelessWidget {
  const FavoriteTv({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: 210,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                final favMovie = accountController.favoriteTvList[index];
                return ProfileCard(
                    movieId: favMovie.id!,
                    heading: favMovie.name!,
                    image: favMovie.posterPath,
                    relDate: favMovie.releaseDate,
                    vote: favMovie.voteAverage!);
              }),
              separatorBuilder: ((context, index) {
                return const SizedBox(
                  width: 10,
                );
              }),
              itemCount: accountController.favoriteTvList.length),
        ));
  }
}
