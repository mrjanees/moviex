import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/views/pages/home_screen/trending/all.dart';
import 'package:mspot/views/wIdgets/common/actor_card_template.dart';
import '../../../../controllers/home/trending/trending.dart';

class Person extends StatelessWidget {
  const Person({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.put(TrendingController.instance);
    });
    if (trendingController.personList.isEmpty) {
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
        itemCount: trendingController.personList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisExtent: 250,
            mainAxisSpacing: 10),
        itemBuilder: (BuildContext context, int index) {
          final data = trendingController.personList[index];

          return ActorCardTemplate(
            avatar: data.profilePath,
            name: data.name!,
            id: data.id!,
          );
        },
      );
    }
  }
}
