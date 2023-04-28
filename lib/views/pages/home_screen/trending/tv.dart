import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/controllers/home/trending/trending.dart';
import 'package:mspot/views/pages/home_screen/trending/all.dart';

import '../../../wIdgets/common/movie_card_template.dart';

class Tv extends StatelessWidget {
  const Tv({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.put(TrendingController.instance);
    });
    if (trendingController.tvList.isEmpty) {
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
        itemCount: trendingController.tvList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisExtent: 250,
            mainAxisSpacing: 10),
        itemBuilder: (BuildContext context, int index) {
          final data = trendingController.tvList[index];
          return MovieCardTemplate(
            mediaType: data.mediaType,
            id: data.id!,
            heading: data.name!,
            image: data.posterPath!,
            relDate: data.firstAirDate!,
            vote: data.voteAverage!,
          );
        },
      );
    }
  }
}
