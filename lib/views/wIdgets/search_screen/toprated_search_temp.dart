import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/controllers/network/network_connectivity.dart';

import 'package:mspot/controllers/search/search_controllers.dart';

import 'package:mspot/views/wIdgets/search_screen/search_card.dart';

final searchControllers = Get.put(SearchControllers.instance);

class TopRatedSearchTemplate extends StatelessWidget {
  const TopRatedSearchTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Get.put(SearchControllers.instance);
    });
    return Obx(() {
      if (searchControllers.topRatedList.isEmpty) {
        return Center(
            child: Text(
          network == 'Offline' ? 'No Internet' : '',
          style: const TextStyle(color: Colors.grey),
        ));
      } else {
        return Expanded(
          child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                final data = searchControllers.topRatedList[index];
                return SearchCard(
                  id: data.id!,
                  image: data.backdropPath!,
                  releasDate: data.releaseDate!,
                  title: data.title!,
                  vote: data.voteAverage!,
                );
              }),
              separatorBuilder: ((context, index) {
                return const SizedBox(
                  height: 10,
                );
              }),
              itemCount: searchControllers.topRatedList.length),
        );
      }
    });
  }
}
