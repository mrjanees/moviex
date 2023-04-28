import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/views/pages/season_info_screen.dart';
import 'package:mspot/views/wIdgets/season_info.dart/episode_card.dart';

class AllEpisodes extends StatelessWidget {
  const AllEpisodes({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    return Obx(() => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          final seasoninfo =
              seasonInfoController.seasonInfoData.value.episodes![index];
          return EpisodesCard(
            episode: seasoninfo.episodeNumber.toString(),
            duration: seasoninfo.runtime,
            id: seasoninfo.id!,
            vote: seasoninfo.voteAverage!,
            image: seasoninfo.stillPath,
            releasDate: seasoninfo.airDate,
            title: seasoninfo.name!,
          );
        }),
        separatorBuilder: ((context, index) {
          return const SizedBox(
            height: 10,
          );
        }),
        itemCount: seasonInfoController.seasonInfoData.value.episodes!.length));
  }
}
