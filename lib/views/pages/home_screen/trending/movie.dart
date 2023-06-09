import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/core/trending_category.dart';
import 'package:mspot/views/pages/home_screen/home_screen.dart';
import 'package:mspot/views/pages/home_screen/trending/all.dart';

import '../../../../controllers/home/trending/trending.dart';
import '../../../wIdgets/common/movie_card_template.dart';

class Movie extends StatelessWidget {
  const Movie({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Get.put(TrendingController.instance);
    });
    return Obx(() {
      if (trendingController.movieList.isEmpty) {
        return const SizedBox(
          height: 100,
          child: Center(
              child: Text(
            'No Internet',
            style: TextStyle(color: Colors.grey),
          )),
        );
      } else {
        return GridView.builder(
          itemCount: trendingController.movieList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisExtent: 250,
              mainAxisSpacing: 10),
          itemBuilder: (BuildContext context, int index) {
            final data = trendingController.movieList[index];
            return MovieCardTemplate(
              maxWidth: maxWidthDevice,
              mediaType: data.mediaType,
              id: data.id!,
              heading: data.title!,
              image: data.posterPath!,
              relDate: data.releaseDate!,
              vote: data.voteAverage!,
            );
          },
        );
      }
    });
  }
}
