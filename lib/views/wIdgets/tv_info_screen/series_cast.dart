import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mspot/views/pages/tv_info_screen.dart';

import '../common/cast_card_widget.dart';

class SeriesCast extends StatelessWidget {
  const SeriesCast({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: tvInfoController.seriesCastList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisExtent: 250,
          mainAxisSpacing: 5),
      itemBuilder: (BuildContext context, int index) {
        final castData = tvInfoController.seriesCastList[index];
        return CastCardWidget(
          id: castData.id!,
          avatar: castData.profilePath,
          name: castData.name!,
          character: castData.character,
        );
      },
    );
  }
}
