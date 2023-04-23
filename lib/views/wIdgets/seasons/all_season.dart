import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/views/wIdgets/seasons/season_card.dart';

import '../../pages/tv_info_screen.dart';

class AllSeasons extends StatelessWidget {
  const AllSeasons({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    return Obx(() => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          final seasons = tvInfoController.tvInfoData.value.seasons![index];
          return SeasonCard(
            id: seasons.id!,
            image: seasons.posterPath,
            releasDate: seasons.airDate,
            title: seasons.name!,
            episodeCount: seasons.episodeCount ?? 0,
          );
        }),
        separatorBuilder: ((context, index) {
          return const SizedBox(
            height: 10,
          );
        }),
        itemCount: tvInfoController.tvInfoData.value.seasons == null
            ? 0
            : tvInfoController.tvInfoData.value.seasons!.length));
  }
}
