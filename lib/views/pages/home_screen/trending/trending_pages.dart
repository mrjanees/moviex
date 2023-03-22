import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mspot/views/pages/home_screen/home_screen.dart';
import 'package:mspot/views/pages/home_screen/trending/all.dart';
import 'package:mspot/views/pages/home_screen/trending/movie.dart';
import 'package:mspot/views/pages/home_screen/trending/person.dart';
import 'package:mspot/views/pages/home_screen/trending/tv.dart';

List trendingPages = [
  const All(),
  const Movie(),
  const Tv(),
  const Person(),
];

class Trending extends StatelessWidget {
  const Trending({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => trendingPages[homecontrollers.categoryIdex.value]);
  }
}
