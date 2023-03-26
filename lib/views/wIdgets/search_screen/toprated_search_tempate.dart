import 'package:flutter/material.dart';

import '../common/movie_card_template.dart';

class TopRatedSearchTemplate extends StatelessWidget {
  const TopRatedSearchTemplate({super.key});

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
        return MovieCardTemplate(
          movieId: 111,
          heading: 'The Godfather',
          image: 'https://img.fruugo.com/product/4/49/14441494_max.jpg',
          relDate: '21 Aug',
          vote: 5.0,
        );
      },
    );
  }
}
