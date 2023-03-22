import 'package:flutter/material.dart';

import '../../../wIdgets/common/card_template.dart';

class Person extends StatelessWidget {
  const Person({super.key});

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
          heading: 'Yua Mikami',
          image:
              'https://image.tmdb.org/t/p/original/vZ2FW6L8mErV81jO7DaeJ6blVTS.jpg',
        );
      },
    );
  }
}
