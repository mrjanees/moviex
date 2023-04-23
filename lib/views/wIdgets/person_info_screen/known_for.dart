import 'package:flutter/material.dart';
import 'package:mspot/views/pages/person_info_screen.dart';
import 'package:mspot/views/wIdgets/person_info_screen/known_for_card.dart';

class KnownFor extends StatelessWidget {
  const KnownFor({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemBuilder: (context, index) {
          final credits = personInfoController.personMovieCredits[index];
          return KnownForCard(
            id: credits.id!,
            image: credits.posterPath,
            title: credits.title!,
          );
        },
        itemCount: personInfoController.personMovieCredits.length,
      ),
    );
  }
}
