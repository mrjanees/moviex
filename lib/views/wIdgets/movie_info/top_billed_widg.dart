import 'package:flutter/material.dart';
import 'package:mspot/views/pages/movie_info_screen.dart';
import '../common/cast_card_widget.dart';

class TopBilled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movieInfoController.topBilledList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisExtent: 250,
          mainAxisSpacing: 5),
      itemBuilder: (BuildContext context, int index) {
        final cast = movieInfoController.topBilledList[index];
        return CastCardWidget(
          id: cast.id!,
          avatar: cast.profilePath,
          name: cast.name!,
          character: cast.character!,
        );
      },
    );
  }
}
