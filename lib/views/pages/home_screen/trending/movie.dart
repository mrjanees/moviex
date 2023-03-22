import 'package:flutter/material.dart';

import '../../../wIdgets/common/card_template.dart';

class Movie extends StatelessWidget {
  const Movie({super.key});

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
        return CardTemplate(
          heading: 'Cocaine Bear',
          image:
              'https://image.tmdb.org/t/p/original/gOnmaxHo0412UVr1QM5Nekv1xPi.jpg',
        );
      },
    );
  }
}
