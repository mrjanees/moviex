import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mspot/controllers/popular_movie/popular_movie.dart';
import 'package:mspot/views/pages/home_screen/home_screen.dart';
import 'package:mspot/views/wIdgets/movie_info/content_widg.dart';

import '../common/movie_card_template.dart';

final popularMoviController = Get.put(PopularMovieControllers.instance);

class PopularMovie extends StatelessWidget {
  PopularMovie({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.put(PopularMovieControllers.instance.topRatedTv());
    });
    return Obx(() => GridView.builder(
          itemCount: popularMoviController.generatedMovieList.isEmpty
              ? popularMoviController.topRatedTvList.length
              : popularMoviController.generatedMovieList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisExtent: 250,
              mainAxisSpacing: 10),
          itemBuilder: (BuildContext context, int index) {
            if (popularMoviController.generatedMovieList.isEmpty) {
              final data = popularMoviController.topRatedTvList[index];
              return MovieCardTemplate(
                maxWidth: maxWidthDevice,
                mediaType: 'tv',
                id: data.id!,
                heading: data.name!,
                image: data.posterPath,
                relDate: data.firstAirDate,
                vote: data.voteAverage!,
              );
            } else {
              final generatedMoviedata =
                  popularMoviController.generatedMovieList[index];
              return MovieCardTemplate(
                maxWidth: maxWidthDevice,
                mediaType: 'GeneratedMovie',
                id: generatedMoviedata.id!,
                heading: generatedMoviedata.title ?? '',
                image: generatedMoviedata.posterPath,
                relDate: generatedMoviedata.releaseDate,
                vote: generatedMoviedata.voteAverage!,
              );
            }
          },
        ));
  }
}
