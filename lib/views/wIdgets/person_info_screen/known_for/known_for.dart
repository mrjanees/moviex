import 'package:flutter/material.dart';
import 'package:mspot/views/pages/person_info_screen.dart';
import 'package:mspot/views/wIdgets/person_info_screen/known_for/known_for_card.dart';

class KnownFor extends StatelessWidget {
  const KnownFor({super.key});

  @override
  Widget build(BuildContext context) {
    return personInfoController.personMovieCredits.isEmpty
        ? const SizedBox(
            height: 100,
            child: Center(
                child: Text(
              'Sorry No known for Availabe',
              style: TextStyle(color: Colors.grey),
            )),
          )
        : SizedBox(
            height: 260,
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
