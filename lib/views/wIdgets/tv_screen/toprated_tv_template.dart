import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mspot/controllers/tv/tv_controllers.dart';
import 'package:mspot/views/wIdgets/movie_info/content_widg.dart';

import '../common/movie_card_template.dart';

class TopRatedTvTemplate extends StatelessWidget {
  final tvController = Get.put(TvControllers());
  TopRatedTvTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.put(TvControllers());
    });
    return Obx(() => GridView.builder(
          itemCount: tvController.topRatedTvList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisExtent: 250,
              mainAxisSpacing: 10),
          itemBuilder: (BuildContext context, int index) {
            final data = tvController.topRatedTvList[index];
            return MovieCardTemplate(
              mediaType: 'tv',
              id: data.id!,
              heading: data.name!,
              image: data.posterPath,
              relDate: data.firstAirDate,
              vote: data.voteAverage!,
            );
          },
        ));
  }
}
