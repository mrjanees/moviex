import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/views/pages/profile_screen.dart';
import 'package:mspot/views/wIdgets/common/movie_card_template.dart';
import 'package:mspot/views/wIdgets/profile/profile_card.dart';

import '../../../controllers/account/controller.dart';

class FavoriteMovie extends StatelessWidget {
  const FavoriteMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: 210,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                final favMovie = accountController.favoriteMovieList[index];
                return ProfileCard(
                    movieId: favMovie.id!,
                    heading: favMovie.title!,
                    image: favMovie.posterPath,
                    relDate: favMovie.releaseDate,
                    vote: favMovie.voteAverage!);
              }),
              separatorBuilder: ((context, index) {
                return const SizedBox(
                  width: 10,
                );
              }),
              itemCount: accountController.favoriteMovieList.length),
        ));
  }
}
