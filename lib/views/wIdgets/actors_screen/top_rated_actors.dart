import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/controllers/actor/actor_controllers.dart';

import 'package:mspot/views/wIdgets/common/actor_card_template.dart';

class TopRatedActorsTemplate extends StatelessWidget {
  final actorControllers = Get.put(ActorsControllers());
  TopRatedActorsTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.put(ActorsControllers());
    });
    return Obx(() => GridView.builder(
          itemCount: actorControllers.topRatedPeopleList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisExtent: 250,
              mainAxisSpacing: 10),
          itemBuilder: (BuildContext context, int index) {
            final data = actorControllers.topRatedPeopleList[index];
            return ActorCardTemplate(
              id: data.id!,
              avatar: data.profilePath,
              name: data.name!,
            );
          },
        ));
  }
}
