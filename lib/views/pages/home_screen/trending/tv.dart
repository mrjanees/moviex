import 'package:flutter/material.dart';

import '../../../wIdgets/common/movie_card_template.dart';

class Tv extends StatelessWidget {
  const Tv({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisExtent: 250,
          mainAxisSpacing: 10),
      itemBuilder: (BuildContext context, int index) {
        return MovieCardTemplate(
          heading: 'The Last of Us',
          image:
              'https://image.tmdb.org/t/p/original/uKvVjHNqB5VmOrdxqAt2F7J78ED.jpg',
        );
      },
    );
  }
}
