import 'package:flutter/material.dart';
import 'package:mspot/views/wIdgets/common/movie_card_template.dart';
import 'package:mspot/views/wIdgets/profile/profile_card.dart';

class FavoriteMovie extends StatelessWidget {
  const FavoriteMovie({super.key});

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
                movieId: 76600,
                heading: 'Avatar: The Way of Water',
                image: '/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg',
                relDate: '2022-12-14',
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
