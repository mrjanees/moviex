import 'package:flutter/material.dart';
import 'package:mspot/views/wIdgets/common/movie_card_template.dart';
import 'package:mspot/views/wIdgets/profile/profile_card.dart';

class WatchlistMovie extends StatelessWidget {
  const WatchlistMovie({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    return SizedBox(
      height: 210,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            return ProfileCard(
                movieId: 502356,
                heading: 'The Super Mario Bros. Movie',
                image: '/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg',
                relDate: '2023-04-05',
                vote: 7.8);
          }),
          separatorBuilder: ((context, index) {
            return const SizedBox(
              width: 10,
            );
          }),
          itemCount: 10),
    );
  }
}
