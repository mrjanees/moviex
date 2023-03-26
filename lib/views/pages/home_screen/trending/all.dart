import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/home/trending/trending.dart';
import '../../../wIdgets/common/movie_card_template.dart';

final trendingController = Get.put(TrendingController());

class All extends StatelessWidget {
  const All({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Get.put(TrendingController());
    });
    return Obx(
      () => GridView.builder(
        itemCount: trendingController.allList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisExtent: 250,
            mainAxisSpacing: 10),
        itemBuilder: (BuildContext context, int index) {
          final data = trendingController.allList[index];

          return MovieCardTemplate(
            movieId: data.id!,
            heading: data.title ?? data.name!,
            image: data.posterPath!,
            relDate: data.releaseDate ?? data.firstAirDate!,
            vote: data.voteAverage!,
          );
        },
      ),
    );
  }
}
