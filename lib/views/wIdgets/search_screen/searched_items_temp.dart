import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/views/wIdgets/search_screen/search_card.dart';
import 'package:mspot/views/wIdgets/search_screen/toprated_search_temp.dart';

import '../../../controllers/search/search_controllers.dart';

class SearchedItemTemplate extends StatelessWidget {
  SearchedItemTemplate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
          child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                final data = searchControllers.searchResultList[index];
                return SearchCard(
                  knownOfDepart: data.knownfordepartment,
                  id: data.id!,
                  image: data.backdropPath ?? data.profilePath,
                  releasDate:
                      data.releaseDate ?? data.firstAirDate ,
                  title: data.title ?? data.name!,
                  vote: data.voteAverage ?? 0.0,
                );
              }),
              separatorBuilder: ((context, index) {
                return const SizedBox(
                  height: 10,
                );
              }),
              itemCount: searchControllers.searchResultList.length),
        ));
  }
}
