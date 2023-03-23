import 'package:flutter/material.dart';

import 'package:mspot/views/wIdgets/common/actor_card_template.dart';

class TopRatedActorsTemplate extends StatelessWidget {
  const TopRatedActorsTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 20,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisExtent: 250,
          mainAxisSpacing: 10),
      itemBuilder: (BuildContext context, int index) {
        return ActorCardTemplate(
          avatar:
              'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/4CR1D9VLWZcmGgh4b6kKuY2NOel.jpg',
          name: 'Tom Hardy',
        );
      },
    );
  }
}
