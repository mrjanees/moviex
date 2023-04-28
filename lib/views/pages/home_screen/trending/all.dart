import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/views/pages/base_screen.dart';
import '../../../../controllers/home/trending/trending.dart';
import '../../../wIdgets/common/movie_card_template.dart';

final trendingController = Get.put(TrendingController.instance);

class All extends StatelessWidget {
  const All({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.put(TrendingController.instance);
    });
    return Obx(() {
      if (trendingController.allList.isEmpty) {
        return const SizedBox(
          height: 100,

          child:  Center(
              child: Text(
            'No Internet',
            style: TextStyle(color: Colors.grey),
          )),
        );
      } else {
        return GridView.builder(
            itemCount: trendingController.allList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisExtent: 250,
                mainAxisSpacing: 5),
            itemBuilder: (BuildContext context, int index) {
              final data = trendingController.allList[index];
              return MovieCardTemplate(
                mediaType: data.mediaType,
                id: data.id!,
                heading: data.title ?? data.name!,
                image: data.posterPath!,
                relDate: data.releaseDate ?? data.firstAirDate!,
                vote: data.voteAverage!,
              );
            });
      }
    });
  }
}
